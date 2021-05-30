//
//  FavoriteTableViewCell.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var movieImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	// MARK: - Variable
	static let identifier: String = "FavoriteTableViewCell"
	
	
	// MARK: - Life cycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	func setupCell(model: Movie) {
//		movieImageView = model
		nameLabel.text = model.title
		yearLabel.text = model.release_year
		descriptionLabel.text = model.summary
	}
		
}
