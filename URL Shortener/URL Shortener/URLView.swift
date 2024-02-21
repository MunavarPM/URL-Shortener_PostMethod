//
//  URLView.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 17/02/24.
//

import SwiftUI
import Foundation

struct URLView: View {
    @State var URL: String = ""
    @StateObject var viewModel = URLShortManager()
    @State var showLogoutAlert: Bool = false
    @EnvironmentObject private var authService: AuthService
    var body: some View {
       NavigationStack {
           ZStack {
                Color("BG")
                   .ignoresSafeArea(.all)
               FireworksView()
               VStack(spacing: 40) {
                   Text("Enter URL here.")
                       .foregroundStyle(Color("BTBG")).bold()
                       .font(.system(size: 28))
                       .frame(maxWidth: .infinity,alignment: .center)
                       .frame(height: UIScreen.main.bounds.height * 0.2)
                   HStack {
                       TextFieldIcon(iconName: "link")
                           .foregroundStyle(.white)
                       TextField("URL Link...", text: $viewModel.inputURL)
                           .colorScheme(.dark)
                           .foregroundStyle(.white.opacity(0.7))
                   }
                   .frame(width: UIScreen.main.bounds.width - 32, height: 36)
                   .frame(height: 52)
                   .background(Color("DBG").cornerRadius(16)
                       .opacity(0.2))
                   .overlay {
                       RoundedRectangle(cornerRadius: 16)
                           .stroke(Color("TextSign").opacity(1.0))
                   }
                   CustomeBT(text: "SUBMIT", width: 40, action: {
                       Task {
                           await viewModel.loadData()
                       }
                   })
                   
                   VStack {
                       Text("New: \(viewModel.resultURL)")
                           .textSelection(.enabled)
                           .font(.system(size: 18, weight: .semibold))
                           .foregroundStyle(Color("TextSign"))
                           .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                           .background(RoundedRectangle(cornerRadius: 25).fill(Color("DBG")))
                           .onTapGesture {
                               guard let url = Foundation.URL(string: viewModel.resultURL) else {
                                   return
                               }
                               UIApplication.shared.open(url, options: [:], completionHandler: nil)
                               
                           }
                       CustomeField(text: "Old: \(viewModel.inputURL)", width: 30)
                           .padding(3)
                   }
                   Button(action: {
                       viewModel.inputURL = ""
                       viewModel.resultURL = ""
                   }, label: {
                       Text("Reset")
                           .font(.system(size: 18, weight: .semibold))
                           .foregroundStyle(.red)
                   })
                   .frame(width: 90, height: 50)
                   .background(RoundedRectangle(cornerRadius: 25).fill(Color("BTBG")))
                   .frame(maxWidth: .infinity,alignment: .center)
                   .padding(.leading)
                   
               }
           }
           .toolbar(content: {
               ToolbarItem(placement: .topBarTrailing) {
                   Button {
                       showLogoutAlert.toggle()
                   } label: {
                       VisualEffectBlur(blurStyle: .light) {
                           
                       }
                       .cornerRadius(12)
                       .overlay(alignment:.leading) {
                           ZStack {
                               RoundedRectangle(cornerRadius: 12)
                                   .stroke(Color.white, lineWidth: 1)
                                   .blendMode(.overlay)
                               Text("Logout")
                                   .foregroundStyle(.red).opacity(0.8)
                                   .font(.system(size: 17, weight: .medium))
                           }
                       }
                       .frame(width: 66, height: 36)
                       .padding([.vertical, .leading], 8)
                   }
               }
           })
           .alert(isPresented: $showLogoutAlert) {
               Alert(
                title: Text("Logout").foregroundStyle(.red),
                   message: Text("\(authService.profile.name != "" ? "\(authService.profile.name)" : "") 🙋🏻‍♂️ Are you sure you want to logout?").fontWeight(.bold),
                   primaryButton: .default(
                       Text("OK"),
                       action: {
                           logout()
                       }
                   ),
                   secondaryButton: .cancel()
               )
           }
       }
       .onReceive(authService.$uid, perform: { uid in /// For fetching user name
           if uid != "" {
               Task {
                   do {
                       try await authService.fetchProfile()
                   } catch {
                       print("Error of Receiveing uid: \(error.localizedDescription)")
                   }
               }
           }
       })
    }
    func logout() {
        do {
            try authService.logOut()
        } catch {
            print("Error logging out: \(error.localizedDescription)")
        }
    }
}
struct CustomeField: View {
    let icon: String? = nil
    let text: String
    let width: Int
    var body: some View {
        Button(action: {}, label: {
            Text("\(text)")
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color("TextSign"))
        })
        .frame(width: UIScreen.main.bounds.width - CGFloat(width), height: 50)
        .background(RoundedRectangle(cornerRadius: 25).fill(Color("DBG")))
    }
}
#Preview {
    URLView()
}
