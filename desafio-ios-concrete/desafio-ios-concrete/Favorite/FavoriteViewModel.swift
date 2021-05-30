//
//  FavoriteViewModel.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import Foundation

class FavoriteViewModel {
	
	// MARK: - Variable
	private var listFavorite: [Movie] = [Movie]()
	private let service: NetworkCoreData = NetworkCoreData()
	
	
	// MARK: - Function
	func fetchFavorite() {
		print(#function)
		listFavorite = []
		let list = service.fetchFavorite()
		
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
			
				print("Criado Favorite------------")
				print("Genres: \(String(describing: favorite.genres))")
				print("Title: \(String(describing: favorite.title))")
				print("Summary: \(String(describing: favorite.summary))")
				print("Poster: \(String(describing: favorite.poster))")
				print("Release: \(String(describing: favorite.release_data))")
				print("is favorite: \(favorite.isFavorite)")
				print("Description: \(String(describing: favorite.genres_description))")
				
			}
		}
	}
	
	func countFavorite() -> Int {
		if listFavorite.isEmpty {
			return 1
		}
		return listFavorite.count
	}
	
	func getFavorite(indexPath: IndexPath) -> Movie {
		return listFavorite[indexPath.row]
	}
	
	func deleteFavorite(indexPath: IndexPath) {
		let favorite = listFavorite[indexPath.row]
		service.deleteFavorite(model: favorite)
	}
	
	func checkListFavoriteEmpty() -> Bool {
		return listFavorite.isEmpty
	}
	
}
