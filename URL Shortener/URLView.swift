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
