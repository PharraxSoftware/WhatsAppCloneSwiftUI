//
//  SettingsViewModel.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    
    @Published var tabbarVisibility: Visibility = .hidden
    
    func logout() {
        AuthService.shared.logout()
    }
}
