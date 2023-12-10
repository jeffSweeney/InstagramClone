//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/8/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var posts: [Post] {
        return Post.MOCK_POSTS.filter { $0.user == user }
    }
    
    var body: some View {
        ScrollView {
            // MARK: - Header
            ProfileHeaderView(user: user)
            
            // MARK: - Post Grid View
            PostGridView(posts: posts)
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS.first!)
}
