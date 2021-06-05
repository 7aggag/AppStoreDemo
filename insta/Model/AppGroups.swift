//
//  AppGroups.swift
//  insta
//
//  Created by Haggag on 03/06/2021.
//

import Foundation

struct AppGroup : Decodable {
    let feed :Feed
}
    struct Feed :Decodable {
        let title : String
        let results : [FeedResults]
    }
struct  FeedResults:Decodable {
    let name , artistName , artworkUrl100 : String
}

struct appheaderdata : Decodable {
  let id, name , tagline, imageUrl : String
}

