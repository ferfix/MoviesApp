//
//  FavoritesRepository.swift
//  Movies
//
//  Created by Fernanda Bezerra on 29/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class FavoritesRepository {
    
    let defaults: UserDefaults = UserDefaults.standard
    private var favorites: [Movie] = []
    let key = "favoriteKey"
    
    public init() {
        self.favorites = getFavorites()
    }
    
    private func syncFavorites() {
        let data = NSKeyedArchiver.archivedData(withRootObject: self.favorites)
        defaults.set(data, forKey: key)
        defaults.synchronize()
        
    }
    
    private func saveFavorites(with movie: Movie) {
       self.favorites.append(movie)
       syncFavorites()
    }
    
    func isFavorite(movie: Movie) -> Bool {
        return favorites.contains(movie)
    }
    
    //toogle
    func toogleFavoriteState(of movie: Movie) {
        if self.favorites.contains(movie) {
            removeFavorite(with: movie)
        } else {
            saveFavorites(with: movie)
        }
    }

    func getFavorites() -> [Movie] {
        guard let favoritesData = defaults.data(forKey: key) else {
            return []
        }
        guard let favoritesMovies = NSKeyedUnarchiver.unarchiveObject(with: favoritesData) as? [Movie] else {
            return []
        }
        
        return favoritesMovies
    }
    
    func removeFavorite(with movie: Movie) {
        guard let index = favorites.index(of: movie) else {
            return
        }
        favorites.remove(at: index)
        syncFavorites()
    }
    
    
    
}
