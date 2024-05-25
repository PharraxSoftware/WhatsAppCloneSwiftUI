//
//  RegistrationViewModel.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var fulname: String = ""
    @Published var phonenumber: String = ""
    @Published var password: String = ""
    
    func creatUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, fullName: fulname, phoneNumber: phonenumber)
    }
}
