//
//  MoviesDataSource.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit


class MoviesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let favoriteService = FavoritesRepository()
    
    var movies: [Movie] = []
    
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCollectionViewCell", for: indexPath) as! MoviesCollectionViewCell
        let movie = movies[indexPath.row]
        
        cell.setupView(with: movie, favoriteService: favoriteService)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow = CGFloat(2)
        let collectionWidth = collectionView.bounds.size.width
        let cellWidth = collectionWidth / numberOfItemsPerRow
        let ratio = CGFloat(1.5)
        let cellHeight = cellWidth * ratio
        return CGSize(width: cellWidth, height: cellHeight)
    }
    

    
}
