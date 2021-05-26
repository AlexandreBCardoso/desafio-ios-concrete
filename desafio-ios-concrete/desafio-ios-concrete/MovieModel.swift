//
//  MovieModel.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 26/05/21.
//

import Foundation

struct Movies: Decodable {
	let page: Int
	let results: [Movie]
}

struct Movie: Decodable {
	let genres: [Int]
	let title: String
	let summary: String
	let poster: String
	let release: String
	
	var isFavorite: Bool = false
	var poster_url: URL? {
		return URL(string: "https://image.tmdb.org/t/p/w200\(poster)")
	}
	
	enum CodingKeys: String, CodingKey {
		case title = "original_title"
		case poster = "poster_path"
		case release = "release_date"
		case summary = "overview"
		case genres = "genre_ids"
	}
}
