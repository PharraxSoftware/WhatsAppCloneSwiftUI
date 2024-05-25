//
//  CircularProfileImageView.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxsmal
    case xsmall
    case small
    case medium
    case large
    case xlarge
    case xxlarge
    
    var dimension: CGFloat {
        switch self {
        case .xxsmal:
            return 28
        case .xsmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xlarge:
            return 80
        case .xxlarge:
            return 120
        }
    }
}

struct CircularProfileImageView: View {
    
    private let size: ProfileImageSize
    var user: User?
    
    init(size: ProfileImageSize, user: User?) {
        self.size = size
        self.user = user
    }
    
    var body: some View {
        if let profileImageUrl = user?.profileImageUrl {
            KFImage(URL(string: profileImageUrl))
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
        } else {
            Image("profile")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileImageView(size: .medium, user: nil)
}
