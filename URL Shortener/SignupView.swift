//
//  SignupView.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 17/02/24.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("BG")
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .leading, spacing: 26) {
                    Text("Sign up")
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
                    
                    CustomeBT(text: "Login", width: 30, action: {
                        print("Login Pressed")
                    })
                    
                    Text("By clicking on Sign up, you agree to our Terms of service and Privacy policy.")
                        .font(.footnote)
                        .foregroundColor(Color.white.opacity(0.7))
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 60, height: 1)
                        .foregroundColor(Color.white.opacity(0.1))
                    
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.footnote)
                            .foregroundStyle(Color("SDTT"))
                        Button {
                            dismiss()
                            print("dissmisss from signup")
                        } label: {
                            Text("Sign in")
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

#Preview {
    SignupView()
}
