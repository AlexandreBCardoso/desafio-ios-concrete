//
//  MovieDetailViewController.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 25/05/21.
//

import UIKit

protocol MovieDetailViewControllerProtocol: class {
	func updateModel(_ model: Movie)
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
	private var movieModel: Movie?
	private weak var delegate: MovieDetailViewControllerProtocol?
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tabBarController?.tabBar.isHidden = true
		setupMovieDetail()
		setupFavorite()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		if let model = movieModel {
			delegate?.updateModel(model)
		}
	}
	
	
	// MARK: - Function
	func setupDetail(model: Movie, delegate: MovieDetailViewControllerProtocol?) {
		self.movieModel = model
		self.delegate = delegate
	}
	
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
			? UIImage(named: NameImage.favorite.rawValue)
			: UIImage(named: NameImage.unfavorite.rawValue)
	}
	
	private func setupMovieDetail() {
		
		if let model = movieModel {
			let favoriteModel = model.isFavorite
				? UIImage(named: NameImage.favorite.rawValue)
				: UIImage(named: NameImage.unfavorite.rawValue)
			let imageUrlString: String = Api_url.imageW500.rawValue.replacingOccurrences(of: "&1",
																												  with: model.poster)
			
			movieImageView.image    = LoadImage.setImageLoad(urlString: imageUrlString)
			nameLabel.text 			= model.title
			yearLabel.text				= model.release.dateFormatter()
			genreLabel.text 			= model.genres_description
			descriptionLabel.text 	= model.summary
			favoriteImageView.image	= favoriteModel
			
		}
		
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
