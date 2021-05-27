//
//  Network.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 26/05/21.
//

import Foundation
import Alamofire

enum Api_url: String {
	case baseUrl 	= "https://api.themoviedb.org/3/movie/"
	case popular 	= "popular?"
	case apiKey 	= "api_key=f0ca6496aecedd1cfc6487c0d9849760"
	case language 	= "language=en-US"
	case page 		= "page=1"
}

class Network {
	
	func getMoviePopular(completion: @escaping(_ success: Movies?) -> Void) {
		let urlString: String = Api_url.baseUrl.rawValue + Api_url.popular.rawValue + Api_url.apiKey.rawValue
			+ "&" + Api_url.language.rawValue + "&" + Api_url.page.rawValue
		
		AF.request(urlString)
			.validate()
			.responseDecodable(of: Movies.self) { (response) in
				guard let movies = response.value else { return completion(nil) }
				completion(movies)
			}
	}
	
}
