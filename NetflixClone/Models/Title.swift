//
//  Title.swift
//  NetflixClone
//
//  Created by naruto kurama on 22.05.2022.
//

import Foundation

struct TrendingTitleResponse : Codable {
    
    let results : [Title]
}
struct Title : Codable {
    
    let id : Int
    let media_type : String?
    let original_language : String?
    let original_title : String?
    let title : String?
    let poster_path : String?
    let overview : String?
    let release_date : String?
    let vote_average : Double
    let vote_count : Int
}
