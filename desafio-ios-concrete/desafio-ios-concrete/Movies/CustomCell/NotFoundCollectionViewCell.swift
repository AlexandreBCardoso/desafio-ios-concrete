//
//  NotFoundCollectionViewCell.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 27/05/21.
//

import UIKit

class NotFoundCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var descriptionLabel: UILabel!
	
	// MARK: - Variable
	static let identifier: String = "NotFoundCollectionViewCell"
	
	
	// MARK: - Life cycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	static func nib() -> UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	func setupCell(text: String?) {
		let descriptionError = ErrorDescription.notFound.rawValue
		if let _text = text {
			descriptionLabel.text = descriptionError.replacingOccurrences(of: "&1",
																							  with: _text)
		}
	}
	
}
