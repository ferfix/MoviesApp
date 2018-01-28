//
//  NetWorkClient.swift
//  Movies
//
//  Created by Fernanda Bezerra on 24/01/18.
//  Copyright © 2018 Fernanda Bezerra. All rights reserved.
//

import UIKit
import Alamofire

enum Result<T> {
    case success(T)
    case error(Error)
}

protocol Network {
    func request(url: URL, callback: @escaping (Result<Data>)-> Void)
}

class SDKNetWork: Network {
    func request(url: URL, callback: @escaping (Result<Data>) -> Void) {
        Alamofire.request(url).responseData { (response) in
            switch response.result {
            case .success(let data):
                callback(.success(data))
            case .failure(let error):
                callback(.error(error))
            }
        }
    }
}

class NetWorkClient {
    
    let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func fetchMovies(search: String, callback: @escaping (Result<MoviesResponse>)-> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=\(search)") else {
            return
        }
        
        network.request(url: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(MoviesResponse.self, from: data)
                    callback(.success(result))
                } catch {
                    callback(.error(error))
                }
            case .error(let error):
                callback(.error(error))
            }
        }
    }
    
    func fetchMovies(callback: @escaping (Result<MoviesResponse>)-> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=42c9d1c2c0578c563f72fd0e2441c9c0&sort_by=popularity.desc") else {
            return
        }
        
        network.request(url: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(MoviesResponse.self, from: data)
                    callback(.success(result))
                } catch {
                    callback(.error(error))
                }
            case .error(let error):
                callback(.error(error))
            }
        }
        
    }
    
}
