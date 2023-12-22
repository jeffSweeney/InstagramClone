//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/19/23.
//

import Firebase
import PhotosUI
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)} }
    }
    @Published var profileImage: Image?
    @Published var name: String
    @Published var bio: String
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.name = user.fullname ?? ""
        self.bio = user.bio ?? ""
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func cancelUpload() {
        selectedImage = nil
        profileImage = nil
    }
    
    func updateUserData() async throws {
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(uiImage)
            data["profileImageUrl"] = imageUrl
        }
        
        if !name.isEmpty && user.fullname != name {
            data["fullname"] = name
        }
        
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
