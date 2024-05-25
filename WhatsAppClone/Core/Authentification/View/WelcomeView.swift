//
//  WelcomeView.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 21.05.2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject private var viewModel = WelcomeViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .font(.subheadline)
                .foregroundStyle(Color(.darkGray))
                .padding()
                Image("welcome_image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width - 80, height: proxy.size.width - 60)
                TitleView()
                LanguageButtonView()
                Spacer()
                
                AgreeButton(width: proxy.size.width, viewModel: viewModel)
            }
            .padding(.horizontal)
            .padding(.bottom)
            .fullScreenCover(isPresented: $viewModel.showLoginView, content: {
                LoginView()
            })
        }
    }
}

#Preview {
    WelcomeView()
}

struct AgreeButton: View {
    
    private var width: CGFloat
    @StateObject private var viewModel: WelcomeViewModel
    
    init(width: CGFloat, viewModel: WelcomeViewModel) {
        self.width = width
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Button(action: {
            viewModel.showLoginView.toggle()
        }, label: {
            Text("Agree and continue")
                .fontWeight(.semibold)
                .font(.subheadline)
                .frame(width: width - 80, height: 44)
                .background(Color(.darkGray))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        })
    }
}

struct TitleView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to WhatsApp")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Read our")
                .foregroundStyle(.gray)
            Text(" Privacy Policy")
                .foregroundStyle(.blue)
            Text(". Tap agree and continue to accept the ")
                .foregroundStyle(.gray)
            Text(" Terms of service")
                .foregroundStyle(.blue)
        }
        .font(.subheadline)
        .padding(.horizontal)
        .padding(.top)
    }
}

struct LanguageButtonView: View {
    var body: some View {
        Capsule()
            .fill(Color(.systemGray5))
            .frame(width: 160, height: 40)
            .overlay {
                HStack {
                    Image(systemName: "network")
                    Spacer()
                    Text("English")
                    Spacer()
                    Image(systemName: "chevron.down")
                }
                .padding(.horizontal)
                .foregroundStyle(Color(.darkGray))
                .font(.subheadline)
            }
            .padding(.top, 14)
    }
}
