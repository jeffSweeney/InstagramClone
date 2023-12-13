//
//  AuthService.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/11/23.
//

import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to sign in user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {}
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
}

// MARK: - Helpers
extension AuthService {
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}

// MARK: - Singleton
extension AuthService {
    static let shared = AuthService()
}
