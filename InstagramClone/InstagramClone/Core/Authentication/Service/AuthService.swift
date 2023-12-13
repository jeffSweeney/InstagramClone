//
//  AuthService.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/11/23.
//

import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {}
    
    @MainActor
    func createUser(withEmail email: String, username: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {}
    
    func signout() async throws {}
    
}

extension AuthService {
    static let shared = AuthService()
}
