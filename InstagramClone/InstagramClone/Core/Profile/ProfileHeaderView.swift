//
//  ProfileHeaderView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/10/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            // MARK: - Pic & Stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(statCount: 215, statTitle: "Posts")
                    UserStatView(statCount: 987, statTitle: "Followers")
                    UserStatView(statCount: 1645, statTitle: "Following")
                }
            }
            .padding(.horizontal)
            
            // MARK: - Name & Bio
            VStack(alignment: .leading, spacing: 4) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                }
                
                Text(user.username)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // MARK: - Action Button
            Button(action: {
                print("DEBUG: Tapped Edit Profile")
            }, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(Color(.black))
                    .overlay {
                        RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                    }
            })
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[1])
}
