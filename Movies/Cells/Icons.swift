//
//  Icons.swift
//  Movies
//
//  Created by Fernanda Bezerra on 16/04/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

enum Icons: String {
    case favoriteGray = "favorite_gray_icon"
    case favoriteYellow = "favorite_yellow_icon"
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }

}
