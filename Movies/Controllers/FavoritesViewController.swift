//
//  FavoritesViewController.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit


class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: FavoriteDataSource?
    
    
    override func viewDidLoad() {
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupDataSource()
    }
    
    func setupDataSource() {
        dataSource = FavoriteDataSource()
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    func setupView() {
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FavoriteTableViewCell")
        tableView.rowHeight = 100
    }
    
}
