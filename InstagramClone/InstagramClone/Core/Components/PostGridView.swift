//
//  PostGridView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/10/23.
//

import SwiftUI

struct PostGridView: View {
    let posts: [Post]
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = UIScreen.main.bounds.width / 3 - 1
    
    var body: some View {
        // MARK: - Post Grid View
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
