//
//  URL_ShortenerApp.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 16/02/24.
//

import SwiftUI
import FirebaseCore

@main
struct URL_ShortenerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("FirebaseApp.configure()")
        return true
    }
}
