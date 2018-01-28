//
//  MoviesCollectionViewCell.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBAction func favoriteButton(_ sender: UIButton) {
    }
    
    func setupView(with movie: Movie) {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(movie.image)")
        image.kf.setImage(with: url)
        title.text = movie.title
    }
}
