//
//  MoviesCollectionCell.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 24/05/21.
//

import UIKit

class MoviesCollectionCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var movieImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var favoriteButton: UIImageView!
	
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
	
	func setupCell(model: Movie?) {
		
		if let _model = model {
			let imageFavorite = _model.isFavorite
				? UIImage(named: NameImage.favorite.rawValue)
				: UIImage(named: NameImage.unfavorite.rawValue)
			
			nameLabel.text = _model.title
			favoriteButton.image = imageFavorite
			let imageUrlString: String = Api_url.imageW500.rawValue.replacingOccurrences(of: "&1", with: _model.poster)
			movieImageView.image = Utils.setImageLoad(urlString: imageUrlString)
		}
		
	}
	
}
