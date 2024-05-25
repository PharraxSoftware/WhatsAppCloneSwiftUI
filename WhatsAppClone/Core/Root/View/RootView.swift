//
//  RootView.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 22.05.2024.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    RootView()
}
