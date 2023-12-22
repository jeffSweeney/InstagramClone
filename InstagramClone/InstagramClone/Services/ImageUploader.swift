//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/22/23.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filenameId = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filenameId)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
