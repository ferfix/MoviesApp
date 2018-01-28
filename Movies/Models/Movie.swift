//
//  Movie.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit


class Movie: Codable {
    
    var title: String
    var overview: String
    var year: String
    var genre: [Int]
    var image: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case overview
        case image = "poster_path"
        case genre = "genre_ids"
        case year = "release_date"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        overview = try values.decode(String.self, forKey: .overview)
        image = try values.decode(String.self, forKey: .image)
        year = try values.decode(String.self, forKey: .year)
        genre = try values.decode([Int].self, forKey: .genre)
    }
}
