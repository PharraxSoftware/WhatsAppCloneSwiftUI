//
//  LoginViewModel.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
    
}
