//
//  MovieDetailViewController.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 25/05/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var movieImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var genreLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var favoriteImageView: UIImageView!
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tabBarController?.tabBar.isHidden = true
		setupFavorite()
	}
	
	
	// MARK: - Function
	private func setupFavorite() {
		favoriteImageView.isUserInteractionEnabled = true
		favoriteImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
																						  action: #selector(favoriteAction(_:))))
	}
	
	@objc
	func favoriteAction(_ sender: UIGestureRecognizer) {
		print(#function)
		print("Tapped")
		favoriteImageView.image = UIImage(named: "favorite_full_icon")
	}
	
}
