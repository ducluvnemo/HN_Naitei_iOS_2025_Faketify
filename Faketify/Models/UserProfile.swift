//
//  UserProfile.swift
//  Faketify
//
//  Created by NguyenDuc on 20.08.2025.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String : Bool]
    let external_urls: [String : String]
    let id: String
    let product: String
    let images: [APIImage]
}

