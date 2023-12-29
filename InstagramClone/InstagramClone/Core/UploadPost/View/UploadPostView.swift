//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/11/23.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack(spacing: 16) {
            // MARK: - Action Toolbar
            HStack {
                Button(action: {
                    dismissView()
                }, label: {
                    Text("Cancel")
                })
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    Task {
                        try await viewModel.uploadPost(caption: self.caption)
                        dismissView()
                    }
                }, label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                })
            }
            .foregroundStyle(.black)
            .padding(.horizontal)
                
            // MARK: - Post Image & Caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .onAppear { imagePickerPresented.toggle() }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

extension UploadPostView {
    private func dismissView() {
        caption = ""
        viewModel.cancelUpload()
        tabIndex = 0 // Return back to Home tab in our MainTabView
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
