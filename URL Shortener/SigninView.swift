//
//  SigninView.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 16/02/24.
//

import SwiftUI

struct SigninView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("BG")
                    .ignoresSafeArea()
                VStack {
                    VStack(alignment: .leading, spacing: 26) {
                        Text("Sign in")
                            .font(Font.largeTitle.bold())
                            .foregroundStyle(Color("TextSign"))
                        Text("Best URL Shortener 10 Milion's of IOS users.")
                            .font(.headline)
                            .foregroundStyle(Color("SDTT"))
                        HStack(spacing: 12) {
                            TextFieldIcon(iconName: "envelope.open.fill")
                            TextField("Email", text: $email)
                                .colorScheme(.dark)
                                .foregroundStyle(.white.opacity(0.7))
                                .autocapitalization(.none)
                                .textContentType(.emailAddress)
                        }
                        .frame(width: UIScreen.main.bounds.width - 32, height: 36)
                        .frame(height: 52)
                        .background(Color("SDTT").cornerRadius(16)
                            .opacity(0.2))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(1.0))
                                .blendMode(.overlay)
                        }
                        HStack {
                            TextFieldIcon(iconName: "key.fill")
                            SecureField("Password", text: $password)
                                .colorScheme(.dark)
                                .foregroundStyle(.white.opacity(0.7))
                                .autocapitalization(.none)
                                .textContentType(.password)
                        }
                        .frame(width: UIScreen.main.bounds.width - 32, height: 36)
                        .frame(height: 52)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(1.0))
                                .blendMode(.overlay)
                        }
                        .background(Color("SDTT").cornerRadius(16).opacity(0.2))
                        
                        CustomeBT(text: "Create Account", width: 30, action: {
                            
                        })
                        
                        HStack(spacing: 4) {
                            Text("Don't have any acount")
                                .font(.footnote)
                                .foregroundStyle(Color("SDTT"))
                            NavigationLink {
                                
                                    SignupView()
                                
                                .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("Sign up")
                                    .foregroundStyle(Color("BTBG"))
                                    .font(.footnote)
                                    .bold()
                            }

                        }
                    }
                }
            }
        }
    }
}


#Preview {
    SigninView()
}

struct TextFieldIcon: View {
    let iconName: String
    var body: some View {
        VisualEffectBlur(blurStyle: .light) {
            
        }
        .cornerRadius(12)
        .overlay(alignment:.leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 1)
                    .blendMode(.overlay)
                Image(systemName: "\(iconName)")
                    .font(.system(size: 17, weight: .medium))
            }
        }
        .frame(width: 36, height: 36)
        .padding([.vertical, .leading], 8)
    }
}
