//
//  MainTabbarView.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI

struct MainTabbarView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView {
            InboxView()
                .tabItem {
                    Image(systemName: "bubble.fill")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Chats")
                }
                .onAppear {
                    selectedTab = 0
                }
            
            Text("Updates")
                .tabItem {
                    Image(systemName: "dial.low")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                    Text("Chats")
                }
                .onAppear {
                    selectedTab = 1
                }
            
            Text("Communities")
                .tabItem {
                    Image(systemName: "person.3")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                    Text("Communities")
                }
                .onAppear {
                    selectedTab = 2
                }
            
            Text("Calls")
                .tabItem {
                    Image(systemName: "phone")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                    Text("Calls")
                }
                .onAppear {
                    selectedTab = 3
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabbarView()
}
