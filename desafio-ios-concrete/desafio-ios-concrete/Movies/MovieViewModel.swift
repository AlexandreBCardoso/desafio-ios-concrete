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
	private var listGenre: Genres?
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
	
	func getListGenres() {
		service.getListGenres { (genres) in
			self.listGenre = genres
		}
	}
	
	func getMovie(indexPath: IndexPath) -> Movie? {
		return movies?.results[indexPath.row]
	}
	
	func updateFavorite(row: Int, isFavorite: Bool) {
		movies?.results[row].isFavorite = isFavorite
	}
	
	func fillGenreName(indexPath: IndexPath) {
		var listName = [String]()
		
		if let movie = self.movies?.results[indexPath.row],
			let listGenre = self.listGenre?.genres {
			
			for genreId in movie.genres {
				for genre in listGenre {
					if genre.id == genreId {
						listName.append(genre.name)
					}
				}
			}
			self.movies?.results[indexPath.row].genres_description = listName.joined(separator: ", ")
		}
		
	}
	
}
