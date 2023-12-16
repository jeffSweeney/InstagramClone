//
//  UserService.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/16/23.
//

import Firebase
import Foundation

struct UserService {
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: User.self) }
    }
}
