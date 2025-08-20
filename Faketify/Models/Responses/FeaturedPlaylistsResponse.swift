//
//  FeaturedPlaylistsResponse.swift
//  SpotifyClone
//
//  Created by NguyenDuc on 20.08.2025.
//

import Foundation

struct FeaturedPlaylistsResponse: Codable {
    let playlists: PlaylistResponse
}
struct PlaylistResponse: Codable {
    let items: [Playlist]
}


struct User: Codable {
    let display_name: String
    let external_urls: [String : String]
    let id: String
}

