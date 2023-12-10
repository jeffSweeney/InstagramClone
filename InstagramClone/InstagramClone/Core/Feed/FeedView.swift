//
//  FeedView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/8/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(Post.MOCK_POSTS.shuffled()) { post in
                        FeedCell(post: post)
                    }
                }
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("instagram_logo_black")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { print("DEBUG: Tapped toolbar paperplane") }, label: {
                        Image(systemName: "paperplane")
                    })
                    .tint(.black)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
