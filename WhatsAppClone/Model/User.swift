//
//  User.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import Foundation


struct User: Codable, Identifiable, Hashable {
    
    var id: String = UUID().uuidString
    let fullname: String
    let email: String
    let phoneNumber: String
    var profileImageUrl: String?
}

extension User {
    
    static let MOCK_USER = User(fullname: "Wanda Maximoff", email: "wanda.maximoff@gmail.com", phoneNumber: "+111111111", profileImageUrl: nil)
}
