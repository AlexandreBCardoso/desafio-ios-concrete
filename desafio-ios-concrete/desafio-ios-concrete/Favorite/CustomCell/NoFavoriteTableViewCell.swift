//
//  NoFavoriteTableViewCell.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import UIKit

class NoFavoriteTableViewCell: UITableViewCell {
	
	// MARK: - Variable
	static let identifier: String = "NoFavoriteTableViewCell"
	
	
	// MARK: - Variable
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
		
}
