//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/9/23.
//

import SwiftUI

struct CurrentUserProfileView: View {    
    // Defaulting "Current user" to Venom for now - will be dynamic later.
    private let currentUser = User.MOCK_USERS[1]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: - Header
                ProfileHeaderView(user: currentUser)
                
                // MARK: - Post Grid View
                PostGridView(posts: Post.MOCK_POSTS.filter { $0.user == currentUser })
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        AuthService.shared.signout()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(Color(.black))
                    })
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
