//
//  NetworkAPI.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 26/05/21.
//

import Foundation
import Alamofire

class NetworkAPI {
	
	func getMoviePopular(completion: @escaping(_ success: Movies?) -> Void) {
		let urlString: String = Api_url.baseUrl.rawValue + Api_url.movie.rawValue + Api_url.popular.rawValue
			+ Api_url.apiKey.rawValue + "&" + Api_url.language.rawValue + "&" + Api_url.page.rawValue
		
		AF.request(urlString).validate()
			.responseDecodable(of: Movies.self) { (response) in
				guard let movies = response.value else { return completion(nil) }
				completion(movies)
			}
	}
	
	func getListGenres(completion: @escaping(_ success: Genres?) -> Void) {
		let urlString: String = Api_url.baseUrl.rawValue + Api_url.genre.rawValue + Api_url.movie.rawValue
			+ Api_url.list.rawValue + Api_url.apiKey.rawValue + "&" + Api_url.language.rawValue
		
		AF.request(urlString)
			.validate()
			.responseDecodable(of: Genres.self) { (response) in
				guard let genres = response.value else { return completion(nil) }
				completion(genres)
			}
	}
	
}
