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
	private let service: NetworkAPI = NetworkAPI()
	private var isFiltering = false
	private var isNotFound = false
	weak var delegate: MovieViewModelProtocol?
	private let serviceCoreData: NetworkCoreData = NetworkCoreData()
	private var listFavorite: [Movie] = [Movie]()
	
	
	// MARK: - Function
	func fetchFavorite() {
		listFavorite = []
		let list = serviceCoreData.fetchFavorite()
		
		if let listCoreData = list {
			for favorite in listCoreData {
				listFavorite.append(Movie(genres: [Int](),
												  title: favorite.title ?? "",
												  summary: favorite.summary ?? "",
												  poster: favorite.poster ?? "",
												  release: favorite.release_data ?? "",
												  isFavorite: favorite.isFavorite,
												  genres_description: favorite.genres_description ?? "")
				)
			}
		}
	}

	func getMoviesPopular() {
		service.getMoviePopular { (movies) in
			
			if let _movies = movies {
				self.movies = _movies
				
				for favorite in self.listFavorite {
					for (index, movie) in _movies.results.enumerated() {
						if movie.title == favorite.title {
							self.movies?.results[index].isFavorite = true
						}
					}
				}
				
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
					isNotFound = true
				}
				
			}
		} else {
			filteredMovies = []
			self.isFiltering = isFiltering
			isNotFound = false
		}
		
	}
	
	func createFavorite(index: Int, model: Movie) {
		if let movie = movies?.results[index] {
			if model.isFavorite && !movie.isFavorite {
				serviceCoreData.createFavorite(model: model)
			} else if !model.isFavorite && movie.isFavorite {
				serviceCoreData.deleteFavorite(model: model)
			}
		}
	}
	
}
