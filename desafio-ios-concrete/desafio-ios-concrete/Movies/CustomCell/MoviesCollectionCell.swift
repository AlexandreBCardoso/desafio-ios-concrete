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
		let favoriteModel = (model?.isFavorite ?? false) ? UIImage(named: "favorite_full_icon")
			: UIImage(named: "favorite_gray_icon")
		nameLabel.text = model?.title
		favoriteButton.image = favoriteModel
		movieImageView.image = imageMovie(url: model?.poster_url)
	}
	
	private func imageMovie(url: URL?) -> UIImage? {
		guard let _url = url else { return nil }
		
		do {
			let imageData = try Data(contentsOf: _url)
			return UIImage(data: imageData)
		} catch  {
			return nil
		}
	}
	
}
