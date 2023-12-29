//
//  UploadPostViewModel.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/11/23.
//

import Firebase
import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage)} }
    }
    @Published var postImage: Image?
    
    private var uiImage: UIImage?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        
        self.postImage = Image(uiImage: uiImage)
    }
    
    func cancelUpload() {
        selectedImage = nil
        postImage = nil
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        guard let imageUrl = try await ImageUploader.uploadImage(uiImage) else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        let post = Post(id: postRef.documentID,
                        ownerUid: uid,
                        caption: caption,
                        likes: 0,
                        imageUrl: imageUrl,
                        timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
}
