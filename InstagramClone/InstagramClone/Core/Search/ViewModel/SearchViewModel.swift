//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/16/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchUsers = [User]()
    
    init() {
        Task { try await self.fetchSearchUsers() }
    }
    
    @MainActor
    private func fetchSearchUsers() async throws {
        try await self.searchUsers = UserService.fetchAllUsers().filter({ user in
            user != AuthService.shared.currentUser
        })
    }
}
