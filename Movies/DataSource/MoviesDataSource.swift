//
//  MoviesDataSource.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit


class MoviesDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var movies: [Movie] = []
    fileprivate let itemsPerRow: CGFloat = 3
    
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
        
        cell.setupView(with: movie)
        
        return cell
    }
    
    
    
    
    
}
