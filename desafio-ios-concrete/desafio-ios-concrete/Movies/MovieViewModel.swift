//
//  MovieViewModel.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 26/05/21.
//

import Foundation

protocol MovieViewModelProtocol: class {
	func successNetwork()
	func errorNetwork()
}

class MovieViewModel {
	
	private var movies: Movies?
	private let service: Network = Network()
	weak var delegate: MovieViewModelProtocol?
	var countMovies: Int {
		return movies?.results.count ?? 0
	}
	
	func getMoviesPopular() {
		service.getMoviePopular { (movies) in
			if movies != nil {
				self.movies = movies
				self.delegate?.successNetwork()
			} else {
				self.delegate?.errorNetwork()
			}
		}
	}
	
	func getMovie(indexPath: IndexPath) -> Movie? {
		return movies?.results[indexPath.row]
	}
	
	func updateFavorite(row: Int, isFavorite: Bool) {
		movies?.results[row].isFavorite = isFavorite
	}
	
}
