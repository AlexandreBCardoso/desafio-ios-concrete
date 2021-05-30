//
//  NetworkCoreData.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import UIKit
import CoreData

class NetworkCoreData {
	
	// Reference to managed object context
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	
	// MARK: - Function
	func fetchFavorite() -> [MovieData]? {

		// Fetch the data from CoreData to display
		do {
			let listFavorite: [MovieData] = try context.fetch(MovieData.fetchRequest())
			print("==> Qtd de favoritos: \(listFavorite.count)")
			return listFavorite
			
		} catch let error {
			print("==>> Erro na leitura do CoreData")
			print(error.localizedDescription)
			return nil
		}

	}
	
	func createFavorite(model: Movie) {
		
		// Create a Movie object
		let newFavorite = MovieData(context: context)
		newFavorite.genres 					= "1"
		newFavorite.title 					= model.title
		newFavorite.summary 					= model.summary
		newFavorite.poster 					= model.poster
		newFavorite.release_data 			= model.release
		newFavorite.isFavorite 				= model.isFavorite
		newFavorite.genres_description	= model.genres_description

		// Save the data
		do {
			try self.context.save()
		} catch let error {
			print("==>> Erro na criacao de Favorite")
			print(error.localizedDescription)
		}
		
	}
	
	func deleteFavorite(model: Movie) {
		let request = MovieData.fetchRequest() as NSFetchRequest<MovieData>
		let predicate = NSPredicate(format: "title == %@", model.title)
		request.predicate = predicate

		// Fetch the data from Core Data to display in the tableview
		do {
			let result = try context.fetch(request)

			if let _result = result.first {
				context.delete(_result)
				try self.context.save()
			}

		} catch let error {
			print("==>> Erro na Delecao")
			print(error.localizedDescription)
		}
		
	}
	
}


