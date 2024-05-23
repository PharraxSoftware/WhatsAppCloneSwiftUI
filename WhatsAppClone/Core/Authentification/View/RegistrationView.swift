//
//  RegistrationView.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            LogoImageView()
            FloatingField(title: "Email", placeholder: "", text: $viewModel.email)
            FloatingField(title: "Full name", placeholder: "", text: $viewModel.fulname)
            FloatingField(title: "Phone number", placeholder: "", text: $viewModel.phonenumber)
            FloatingField(title: "Password", placeholder: "", text: $viewModel.password)
            Spacer()
        }
    }
}

#Preview {
    RegistrationView()
}
