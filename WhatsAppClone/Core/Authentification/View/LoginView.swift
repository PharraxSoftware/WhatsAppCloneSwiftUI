//
//  LoginView.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                LogoImageView()
                FloatingField(title: "Email", placeholder: "", text: $viewModel.email)
                FloatingField(title: "Password", placeholder: "", text: $viewModel.password)
                Text("Forgot password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top)
                    .padding(.trailing, 28)
                
                Button(action: {
                    Task { try await viewModel.login() }
                }, label: {
                    Text("Login")
                        .authentificationButtonModifier()
                })
                .padding(.vertical)
                Spacer()
                Divider()
                NavigationLink {
                    RegistrationView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

struct LogoImageView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .padding()
    }
}
