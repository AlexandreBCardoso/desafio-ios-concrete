//
//  ErrorMovieCollectionViewCell.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 25/05/21.
//

import UIKit

class ErrorMovieCollectionViewCell: UICollectionViewCell {
	
	// MARK: - Variable
	static let identifier: String = "ErrorMovieCollectionViewCell"
	
	
	// MARK: - Life cycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
}
