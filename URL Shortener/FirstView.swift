//
//  FirstView.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 16/02/24.
//

import SwiftUI
import AuthenticationServices

struct FirstView: View {
    @State var showSignIn: Bool = false
    var body: some View {
        ZStack {
            Color("BG")
            .ignoresSafeArea(.all)
            VStack {
                Text("URL Shortener For IOS")
                    .foregroundStyle(Color("BTBG")).bold()
                    .font(.system(size: 28))
                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
                Image("OnBoard")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                CustomeBT(text: "Create an Account", width: 60, action: {
                    showSignIn.toggle()
                })
                    .padding()
                SignInWithAppleButton { request in
                    
                } onCompletion: { result in
                    
                }
                .frame(width: UIScreen.main.bounds.width - CGFloat(60), height: 45)
                .signInWithAppleButtonStyle(.black)
                
                HStack {
                    Text("Already have an account?")
                        .foregroundStyle(Color("SDTT"))
                    Text("Sign in")
                        .foregroundStyle(Color("BTBG"))
                        .onTapGesture {
                            showSignIn.toggle()
                        }
                }
                .font(.system(size: 14))
                .padding()
            }
        }
        .fullScreenCover(isPresented: $showSignIn) {
            SigninView()
        }
    }
}

#Preview {
    FirstView()
}

struct CustomeBT: View {
    let text: String
    let width: Int
    let action: () -> ()
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text("\(text)")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(.black)
        })
        .frame(width: UIScreen.main.bounds.width - CGFloat(width), height: 50)
        .background(RoundedRectangle(cornerRadius: 25).fill(Color("BTBG")))
    }
}
//HStack {
//    Image("AppleLogo")
//        .resizable()
//        .frame(width: 30, height: 30)
//    Button(action: {}, label: {
//        Text("Sign in with Apple")
//            .font(.system(size: 18, weight: .semibold))
//            .foregroundStyle(.white)
//    })
//}
