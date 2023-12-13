//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/13/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
