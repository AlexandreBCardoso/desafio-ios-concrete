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
	
	override func prepareForReuse() {
		super.prepareForReuse()
		movieImageView.image = nil
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	func setupCell(model: Movie) {
		let urlImage = Api_url.imageW500.rawValue.replacingOccurrences(of: "&1", with: model.poster)
		movieImageView.image = Utils.setImageLoad(urlString: urlImage)
		nameLabel.text = model.title
		yearLabel.text = model.release.dateFormatter()
		descriptionLabel.text = model.summary
	}
		
}
