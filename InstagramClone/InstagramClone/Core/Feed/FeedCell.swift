//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/8/23.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // MARK: - Profile Image & Username
            HStack {
                if let user = post.user {
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // MARK: - Post Image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // MARK: - Action Buttons
            HStack(spacing: 8) {
                Button(action: { print("DEBUG: Like Post") }, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                
                Button(action: { print("DEBUG: Comment on Post") }, label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                })
                
                Button(action: { print("DEBUG: Share Post") }, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .tint(.black)
            
            // MARK: - Likes Label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 2)
            
            // MARK: - Caption Label
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) + // The '+' treats this as one big text component for clean multi-line spacing
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            // MARK: - Timestamp
            Text("6h ago")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 2)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[1])
}
