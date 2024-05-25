//
//  Message.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import SwiftUI

struct Message: Identifiable, Hashable, Codable {
    
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timeStamp: Timestamp
    let isImage: Bool
    let isAudio: Bool
    let isVideo: Bool
    var user: User?
    var id: String {
        return messageId ?? UUID().uuidString
    }
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
}

struct MessageGroup: Identifiable, Hashable {
    var id = UUID().uuidString
    var messages: [Message]
    let date: Date
}

extension MessageGroup {
    static let MOCK_MESSAGE_GROUP = [MessageGroup(messages: [
        Message(fromId: "", toId: "", messageText: "Hello Mr Dwight", timeStamp:  Timestamp(), isImage: true, isAudio: false, isVideo: false, user: nil),
        Message(fromId: "", toId: "", messageText: "Hello Mr Dwight", timeStamp:  Timestamp(), isImage: true, isAudio: false, isVideo: false, user: nil),
        Message(fromId: "", toId: "", messageText: "Hello Mr Dwight", timeStamp:  Timestamp(), isImage: true, isAudio: false, isVideo: false, user: nil),
        Message(fromId: "", toId: "", messageText: "Hello Mr Dwight", timeStamp:  Timestamp(), isImage: true, isAudio: false, isVideo: false, user: nil),
        Message(fromId: "", toId: "", messageText: "Hello Mr Dwight", timeStamp:  Timestamp(), isImage: true, isAudio: false, isVideo: false, user: nil),
        Message(fromId: "", toId: "", messageText: "Hello Mr Dwight", timeStamp:  Timestamp(), isImage: true, isAudio: false, isVideo: false, user: nil),
        Message(fromId: "", toId: "", messageText: "Hello Mr Dwight", timeStamp:  Timestamp(), isImage: true, isAudio: false, isVideo: false, user: nil),
    ], date: Date())]
}

