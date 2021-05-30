//
//  Extension+String.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import Foundation

extension String {
	
	func dateFormatter() -> String {
		let dateFormatter = DateFormatter()
		let dateYear = DateFormatter()
		
		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateYear.dateFormat = "yyyy"
		return dateYear.string(from: dateFormatter.date(from: self) ?? Date())
	}
	
}
