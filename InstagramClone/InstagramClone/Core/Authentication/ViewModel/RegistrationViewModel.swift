//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/13/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var username = ""
    @Published var password = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email,
                                                username: username,
                                                password: password)
        resetViewModel() // Clear the form
    }
    
    // Keeping private for now but defined as func in case we want to let other parts of the app use this later on.
    private func resetViewModel() {
        email = ""
        username = ""
        password = ""
    }
}
