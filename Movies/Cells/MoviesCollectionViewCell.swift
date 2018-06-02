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
    
    var movie: Movie?
    var favoriteService = FavoritesRepository()
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func setupFavoriteIconState() {
        
//        guard let favoriteService = favoriteService else {
//            return
//        }
        
        guard let movie = movie else {
            return
        }
        
        let gray = Icons.favoriteGray.image
        let yellow = Icons.favoriteYellow.image
        
        
        if favoriteService.isFavorite(movie: movie) {
            favoriteButton.setImage(yellow, for: .normal)
        } else {
            favoriteButton.setImage(gray, for: .normal)
        }
    }

    @IBAction func favoriteButton(_ sender: UIButton) {
        if let movie = movie {
            favoriteService.toogleFavoriteState(of: movie)
            setupFavoriteIconState()
        }
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        let gray = Icons.favoriteGray.image
//        favoriteButton.setImage(gray, for: .normal)
//    }
    
    func setupView(with movie: Movie, favoriteService: FavoritesRepository) {
        self.movie = movie
        //self.favoriteService = favoriteService
        image.kf.setImage(with: movie.fullImageURL)
        title.text = movie.title
        setupFavoriteIconState()
    }
}
