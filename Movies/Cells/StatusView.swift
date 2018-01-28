//
//  StatusView.swift
//  Movies
//
//  Created by Fernanda Bezerra on 18/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

class StatusView: UIView {

    @IBOutlet weak var imageIcon: UIImageView!
    
    @IBOutlet weak var messageLagel: UILabel!
    
    func setupView(image: UIImage, message: String) {
        imageIcon.image = image
        messageLagel.text = message
    }

}
