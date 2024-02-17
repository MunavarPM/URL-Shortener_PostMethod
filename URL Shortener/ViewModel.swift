//
//  ViewModel.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 17/02/24.
//

import Foundation
//"4sGXzraerTTaHHSLVRYJvffck8JI5YcHXOq7DESKWWucTE6CxPk6WHwWSIsP"
@MainActor ///Need to run in main thread
class URLShortManager: ObservableObject {
    private let API_KEY = "4sGXzraerTTaHHSLVRYJvffck8JI5YcHXOq7DESKWWucTE6CxPk6WHwWSIsP"
    @Published var resultURL = ""
    @Published var inputURL = "https://9to5mac.com/2024/02/16/best-apple-vision-apps/"
    
    func loadData() async {
           guard let url = URL(string: "https://api.tinyurl.com/create") else {
               print("Invalid URL")
               return
           }
           
           let parameters = ["url": inputURL, "api_token": API_KEY]
           do {
               let requestData = try JSONSerialization.data(withJSONObject: parameters, options: [])
               
               var request = URLRequest(url: url)
               request.httpMethod = "POST"
               request.httpBody = requestData
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               
               let (data, _) = try await URLSession.shared.data(for: request)
               let shortendedURL = try JSONDecoder().decode(URLShort.self, from: data)
               
               DispatchQueue.main.async {
                   self.resultURL = "https://tinyurl.com/" + shortendedURL.data.alias
               }
           } catch {
               print(error.localizedDescription)
               DispatchQueue.main.async {
                   self.resultURL = "Please enter a valid URL"
               }
           }
       }
   }
        

    
//    func getData() {
//        ///web API endpoint Protocol,
//        guard let url = URL(string: "https://api.tinyurl.com/create?url=\(inputURL)&api_token=\(API_KEY)") else {
//            print("⚠️Invalid URL")
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            
//            guard let data = data else {
//                print("⚠️Could not retrive Data")
//                DispatchQueue.main.async {
//                    self.resultURL = "⚠️Could not retrive Data"
//                }
//                return
//            }
//            do {
//                let shortendedURL = try JSONDecoder().decode(URLShort.self, from: data) ///Data is there we decoding the data
//                
//                DispatchQueue.main.async {
//                    print("ShortendedURL\(shortendedURL)")
//                    self.resultURL = "https://tinyurl.com/" + shortendedURL.data.alias
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    print(error.localizedDescription)
//                    print("⚠️ Error in URL")
//                    self.resultURL = "Please enter valid URL"
//                }
//            }
//        }
//        .resume() /// Because URL session is asyc
//    }

