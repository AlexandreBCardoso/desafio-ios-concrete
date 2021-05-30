//
//  NetworkCoreData.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import UIKit
import CoreData

class NetworkCoreData {
	
	// MARK: - Variable
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	
	// MARK: - Function
	func fetchFavorite() -> [MovieData]? {

		do {
			let listFavorite: [MovieData] = try context.fetch(MovieData.fetchRequest())
			return listFavorite
			
		} catch let error {
			print("==>> Erro na leitura do CoreData")
			print(error.localizedDescription)
			return nil
		}

	}
	
	func createFavorite(model: Movie) {
		let newFavorite = MovieData(context: context)
		newFavorite.genres 					= ""
		newFavorite.title 					= model.title
		newFavorite.summary 					= model.summary
		newFavorite.poster 					= model.poster
		newFavorite.release_data 			= model.release
		newFavorite.isFavorite 				= true
		newFavorite.genres_description	= model.genres_description

		do {
			try self.context.save()
		} catch let error {
			print(error.localizedDescription)
		}
		
	}
	
	func deleteFavorite(model: Movie) {
		let request = MovieData.fetchRequest() as NSFetchRequest<MovieData>
		let predicate = NSPredicate(format: "title == %@", model.title)
		request.predicate = predicate

		do {
			let result = try context.fetch(request)

			if let _result = result.first {
				context.delete(_result)
				try self.context.save()
			}

		} catch let error {
			print(error.localizedDescription)
		}
		
	}
	
}


