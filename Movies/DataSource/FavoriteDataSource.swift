//
//  FavoriteDataSource.swift
//  Movies
//
//  Created by Fernanda Bezerra on 31/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class FavoriteDataSource: NSObject, UITableViewDataSource {
    
    var favoriteService = FavoritesRepository()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteService.getFavorites().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        let movie = favoriteService.getFavorites()[indexPath.row]
        
        cell.setupCell(with: movie)
        return cell
    }
    
    
}
