//
//  ViewModel.swift
//  URL Shortener
//
//  Created by MUNAVAR PM on 17/02/24.
//

import Foundation


//https://api.1pt.co/addURL?long=https://apple.com
//S8wUCn8xshToZ2GvMaUcKtkr3ZutHW4okfEnXabtqDak0gVFYtZZSs18DgGW



// MARK: - DataClass
struct URLShort: Codable {
    var data: URLData
    var code: Int
    var errors: [String?]
}

// MARK: - DataClass
struct URLData: Codable {
    var url, domain, alias: String
    var tinyURL: String?
}
struct URLShortTiny:Codable{
    var tinyURL: String?
}
