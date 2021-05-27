//
//  GenreModel.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 26/05/21.
//

import Foundation

struct Genres: Decodable {
	let genres: [Genre]
}

struct Genre: Decodable {
	let id: Int
	let name: String
}
