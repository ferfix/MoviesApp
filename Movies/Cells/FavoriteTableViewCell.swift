//
//  FavoriteTableViewCell.swift
//  Movies
//
//  Created by Fernanda Bezerra on 31/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var overview: UITextView!
    
    
    
    func setupCell(with movie: Movie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.image)")
        imageMovie.kf.setImage(with: url)
        title.text = movie.title
        overview.text = movie.overview
    }
    
}
