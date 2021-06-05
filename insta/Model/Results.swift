//
//  Results.swift
//  insta
//
//  Created by Haggag on 31/05/2021.
//

import Foundation

struct Results : Codable {
    var results :[result]?
}

struct result :Codable {
    var trackName : String
    var primaryGenreName : String
    var screenshotUrls :[String]
    var averageUserRating : Float16
    var artworkUrl100 : String
    
}
