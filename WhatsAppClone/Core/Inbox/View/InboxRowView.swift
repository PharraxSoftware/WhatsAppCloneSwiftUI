//
//  InboxRowView.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI

struct InboxRowView: View {
    
    private var width: CGFloat
    private var message: Message
    
    init(width: CGFloat, message: Message) {
        self.width = width
        self.message = message
    }
    
    var body: some View {
        HStack(spacing: 12) {
            CircularProfileImageView(size: .medium, user: message.user)
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user?.fullname ?? "")
                    .fontWeight(.semibold)
                if message.isImage {
                    Text("Send picture")
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .frame(maxWidth: width - 100, alignment: .leading)
                } else if message.isVideo {
                    Text("Send Video")
                        .foregroundStyle(.gray)
                        .lineLimit(2)
                        .frame(maxWidth: width - 100, alignment: .leading)
                } else {
                    Text(message.messageText)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .frame(maxWidth: width - 100, alignment: .leading)
                }
            }
            .font(.subheadline)
            HStack {
                Text(message.timeStamp.dateValue().timeString())
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

//#Preview {
//    InboxRowView(width: 300, message: Message.)
//}
