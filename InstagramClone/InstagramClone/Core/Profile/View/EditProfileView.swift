//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/19/23.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            // MARK: - Toolbar
            HStack {
                Button(action: {
                    print("Tapped Cancel")
                    dismiss()
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    Task { try await viewModel.updateUserData() }
                    dismiss()
                }, label: {
                    Text("Done")
                        .fontWeight(.bold)
                })
            }
            .padding(.horizontal)
            
            Divider()
            
            // MARK: - Profile Image & Edit
            VStack {
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack {
                        viewModel.currentProfileImage()
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                        
                        Text("Edit profile picture")
                            .font(.subheadline)
                        
                        Divider()
                    }
                }
            }
            .padding(.vertical, 8)
            
            // MARK: - Name & Bio
            VStack(spacing: 8) {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.name)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[1])
}

// MARK: - Profile Row Template
struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}
