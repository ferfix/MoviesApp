//
//  MoviesResponse.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit


class MoviesResponse: Codable {
    
    var movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movies = try values.decode([Movie].self, forKey: .movies)
    }
    
}
