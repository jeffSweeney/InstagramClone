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
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email,
                                                username: username,
                                                password: password)
    }
}
