//
//  NewMessageViewModel.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 22.05.2024.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        Task {
            try await fetchContacts()
        }
    }
    
    private func fetchContacts() async throws {
        let users = try await UserService.shared.fetchAllUser()
        guard let currentUserId = Auth.auth().currentUser?.uid else { return }
        self.users = users.filter({ $0.id != currentUserId })
    }
}
