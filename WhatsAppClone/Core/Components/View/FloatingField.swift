//
//  FloatingField.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI

struct FloatingField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.gray)
                .font(.system(.subheadline, design: .rounded))
                .offset(y: text.isEmpty ? 0 : -25)
            VStack {
                if title == "Password" {
                    SecureField(placeholder, text: $text)
                } else if title == "Phone number" {
                    TextField(placeholder, text: $text)
                        .keyboardType(.numberPad)
                } else {
                    TextField(placeholder, text: $text)
                }
                Divider()
            }
        }
        .animation(.default, value: text.isEmpty ? 0 : -25)
        .padding()
        .padding(.top, text.isEmpty ? 0 : 18)
    }
}


#Preview {
    FloatingField(title: "", placeholder: "Placeholder", text: .constant(""))
}
