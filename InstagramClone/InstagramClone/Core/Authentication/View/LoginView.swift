//
//  LoginView.swift
//  InstagramClone
//
//  Created by Jeffrey Sweeney on 12/8/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // MARK: - Logo Image
                Image("instagram_logo_black")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                    
                // MARK: - Text Fields
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                }
                
                // MARK: - Forgot Password Button
                Button(action: { print("DEBUG: Tapped forgot password") }, label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                // MARK: - Log In Button
                Button(action: {
                    Task { try await viewModel.login() }
                }, label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                })
                .padding(.vertical)
                
                // MARK: - Divider
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2 - 40), height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2 - 40), height: 0.5)
                }
                .foregroundStyle(Color(.gray))
                
                // MARK: - Facebook Login
                HStack {
                    Image("facebook_logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 4)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
