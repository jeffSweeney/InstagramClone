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
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)} }
    }
    @Published var profileImage: Image?
    @Published var name: String = ""
    @Published var bio: String = ""
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func cancelUpload() {
        selectedImage = nil
        profileImage = nil
    }
    
    func currentProfileImage() -> Image {
        return profileImage ?? Image(systemName: "person")
    }
}
