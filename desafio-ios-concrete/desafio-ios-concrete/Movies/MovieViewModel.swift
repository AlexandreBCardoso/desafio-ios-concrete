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
	
	// MARK: - Variable
	private var movies: Movies?
	private var filteredMovies = [Movie]()
	private var listGenre: Genres?
	private let service: Network = Network()
	private var isFiltering = false
	private var isNotFound = false
	weak var delegate: MovieViewModelProtocol?
	
	
	// MARK: - Function
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
		if isFiltering && !isNotFound{
			return filteredMovies[indexPath.row]
		}
		return movies?.results[indexPath.row]
	}
	
	func countMovies() -> Int {
		if isFiltering {
			if isNotFound {
				return 1
			} else {
				return filteredMovies.count
			}
		} else {
			return movies?.results.count ?? 0
		}
	}
	
	func checkNotFound() -> Bool {
		return isNotFound
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
	
	func filterContentForSearchText(_ searchText: String, isFiltering: Bool) {
		if isFiltering && searchText != "" {
			self.isFiltering = isFiltering
			if let movies = movies?.results {
				filteredMovies = movies.filter({ (movie) -> Bool in
					return movie.title.lowercased().contains(searchText.lowercased())
				})
				
				if filteredMovies.isEmpty {
					print("Não encontrado")
					isNotFound = true
				}

				
			}
		} else {
			filteredMovies = []
			self.isFiltering = isFiltering
			isNotFound = false
		}
		
		
		for name in filteredMovies {
			print("Qntd Filtrado: \(filteredMovies.count)")
			print("Movies Filtrado: \(name.title)")
			print("--------------------------------")
		}
		
	}
	
}
