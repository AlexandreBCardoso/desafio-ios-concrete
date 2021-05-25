//
//  MoviesCollectionCell.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 24/05/21.
//

import UIKit

class MoviesCollectionCell: UICollectionViewCell {
	
	// MARK: - Variable
	static let identifier: String = "MoviesCollectionCell"
	
	
	// MARK: - Life cycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
}
