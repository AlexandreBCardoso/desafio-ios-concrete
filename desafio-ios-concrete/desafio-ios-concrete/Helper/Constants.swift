//
//  Constants.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import Foundation


// MARK: - API
enum Api_url: String {
	case baseUrl 	= "https://api.themoviedb.org/3/"
	case movie 		= "movie/"
	case genre 		= "genre/"
	case popular 	= "popular?"
	case list      = "list?"
	case apiKey 	= "api_key=f0ca6496aecedd1cfc6487c0d9849760"
	case language 	= "language=en-US"
	case page 		= "page=1"
}


// MARK: - Segue
enum Segue: String {
	case detail 	= "movieDetail"
}


// MARK: - Name Image
enum NameImage: String {
	case favorite	 = "favorite_full_icon"
	case unfavorite = "favorite_gray_icon"
}


// MARK: - Error
enum ErrorDescription: String {
	case notFound =
	"""
	Sua busca por "&1", não resultou em nenhum resultado.
	"""
}
