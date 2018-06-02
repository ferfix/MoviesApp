//
//  MoviesViewController.swift
//  Movies
//
//  Created by Fernanda Bezerra on 18/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit

enum State {
    case loading
    case errorView
    case searchError
    case success
}


class MoviesViewController: UIViewController {
    
    var network = NetWorkClient(network: SDKNetWork())
    var movies: [Movie] = []
    var dataSource: MoviesDataSource?
    @IBOutlet weak var containerView: UIView!
    weak var statusView: StatusView?
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewState: State = .loading {
        didSet {
            switch viewState {
            case .loading:
                break
            case .errorView:
                if let image = UIImage(named: "search_icon") {
                    self.statusView?.setupView(image: image,
                                               message: "Error generico")
                }
                self.collectionView.isHidden = true
                self.statusView?.isHidden = false
             case .searchError:
                if let image = UIImage(named: "search_icon") {
                    self.statusView?.setupView(image: image,
                                               message: "Não foi possível encontrar nenhum resultado")
                }
                self.collectionView.isHidden = true
                self.statusView?.isHidden = false
            case .success:
                self.collectionView.isHidden = false
                self.statusView?.isHidden = true
            }
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupStateViews()
        fetch()
        setupNavigationItem()
        self.searchBar.delegate = self
        dataSource = MoviesDataSource(movies: movies)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }
    
    
    
    func registerCells() {
        let identifier = "MoviesCollectionViewCell"
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func refreshView(with movies: [Movie]) {
        dataSource?.movies = movies
        collectionView.reloadData()
    }
    

    func setupStateViews() {
        let xib = UINib(nibName: "StatusView", bundle: nil)
        guard let statusView = xib.instantiate(withOwner: nil, options: nil)[0] as? StatusView else {
            fatalError("Não consegui fazer o cast")
        }
        self.statusView = statusView
        self.statusView?.isHidden = true
        containerView.addSubview(statusView)
    }
    
    func setupNavigationItem() {
        tabBarController?.navigationItem.title = "Movies"
        let addButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(navigateToFilter))
        tabBarController?.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func navigateToFilter() {
        let storyboad = UIStoryboard(name: "FilterViewController", bundle: nil)
        let controller = storyboad.instantiateViewController(withIdentifier: "FilterViewController")
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func fetch() {
        network.fetchMovies { (result) in
            switch result {
            case .success(let response):
                self.viewState = .success
                self.refreshView(with: response.movies)
            case .error:
                self.viewState = .errorView
            }
        }
    }
}

extension MoviesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = searchBar.text else {
            return
        }
        let newString = searchText.replacingOccurrences(of: " ", with: "+")
        
        network.fetchMovies(search: newString) { result in
            searchBar.resignFirstResponder()
            switch result {
            case .success(let response):
                if !response.movies.isEmpty {
                    self.refreshView(with: response.movies)
                } else {
                    self.viewState = .searchError
                }
            case .error:
                self.viewState = .success
            }
        }
    }
}
