//
//  Movie.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit


class Movie: NSObject, Codable, NSCoding {
    
    var title: String
    var overview: String
    var year: String
    var genre: [Int]
    var image: String
    var id: Int
    
    private enum CodingKeys: String, CodingKey {
        case title
        case overview
        case image = "poster_path"
        case genre = "genre_ids"
        case year = "release_date"
        case id
    }
    
    init(title: String, overview: String, year: String, genre: [Int], image: String, id: Int) {
        self.title = title
        self.overview = overview
        self.year = year
        self.genre = genre
        self.image = image
        self.id = id
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let overview = aDecoder.decodeObject(forKey: "overview") as! String
        let year = aDecoder.decodeObject(forKey: "year") as! String
        let genre = aDecoder.decodeObject(forKey: "genre") as! [Int]
        let image = aDecoder.decodeObject(forKey: "image") as! String
        let id = aDecoder.decodeInteger(forKey: "id")
        
        self.init(title: title, overview: overview, year: year, genre: genre, image: image, id: id)
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(overview, forKey: "overview")
        aCoder.encode(year, forKey: "year")
        aCoder.encode(genre, forKey: "genre")
        aCoder.encode(image, forKey: "image")
        aCoder.encode(id, forKey: "id")
        
        
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        overview = try values.decode(String.self, forKey: .overview)
        image = try values.decode(String.self, forKey: .image)
        year = try values.decode(String.self, forKey: .year)
        genre = try values.decode([Int].self, forKey: .genre)
        id = try values.decode(Int.self, forKey: .id)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        return id == (object as? Movie)?.id
    }
    
}

extension Movie {
    var fullImageURL: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(image)")
    }
}

