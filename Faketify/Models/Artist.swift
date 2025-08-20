//
//  Artist.swift
//  Faketify
//
//  Created by NguyenDuc on 20.08.2025.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String : String]

}
       
