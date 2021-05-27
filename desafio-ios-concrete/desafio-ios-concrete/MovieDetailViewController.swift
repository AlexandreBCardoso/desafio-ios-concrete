//
//  MovieDetailViewController.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 25/05/21.
//

import UIKit

protocol MovieDetailViewControllerProtocol: class {
	func updateModel(_ model: Movie?)
}

class MovieDetailViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var movieImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var genreLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var favoriteImageView: UIImageView!
	
	// MARK: - Variable
	var movieModel: Movie?
	weak var delegate: MovieDetailViewControllerProtocol?
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tabBarController?.tabBar.isHidden = true
		setupMovieDetail()
		setupFavorite()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		delegate?.updateModel(movieModel)
	}
	
	
	// MARK: - Function
	private func setupFavorite() {
		favoriteImageView.isUserInteractionEnabled = true
		favoriteImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
																						  action: #selector(favoriteAction(_:))))
	}
	
	@objc
	func favoriteAction(_ sender: UIGestureRecognizer) {
		let favorite: Bool = !(movieModel?.isFavorite ?? false)
		movieModel?.isFavorite = favorite
		
		favoriteImageView.image = favorite
			? UIImage(named: "favorite_full_icon")
			: UIImage(named: "favorite_gray_icon")
	}
	
	private func setupMovieDetail() {
		let favoriteModel = (movieModel?.isFavorite ?? false)
			? UIImage(named: "favorite_full_icon")
			: UIImage(named: "favorite_gray_icon")
		
		movieImageView.image = imageMovie(url: movieModel?.poster_url)
		nameLabel.text = movieModel?.title
		yearLabel.text = movieModel?.release
		genreLabel.text = "\(String(describing: movieModel?.genres.first))"
		descriptionLabel.text = movieModel?.summary
		favoriteImageView.image = favoriteModel
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
