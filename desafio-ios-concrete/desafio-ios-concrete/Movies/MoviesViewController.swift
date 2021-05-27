//
//  MoviesViewController.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 24/05/21.
//

import UIKit

class MoviesViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var moviesCollectionView: UICollectionView!
	
	
	// MARK: - Variable
	lazy var searchController: UISearchController = {
		let search = UISearchController(searchResultsController: nil)
		search.searchBar.placeholder = "Search"
		return search
	}()
	private let viewModel: MovieViewModel = MovieViewModel()
	private var selectItem: Int = 0
	
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupSearchController()
		setupCollectionView()
		fetchMovies()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tabBarController?.tabBar.isHidden = false
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "movieDetail" {
			if let vc = segue.destination as? MovieDetailViewController {
				vc.movieModel = sender as? Movie
				vc.delegate = self
			}
		}
	}
	
	
	// MARK: - Function
	private func setupSearchController() {
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
	}
	
	private func setupCollectionView() {
		moviesCollectionView.dataSource = self
		moviesCollectionView.delegate = self
		moviesCollectionView.register(MoviesCollectionCell.nib(),
												forCellWithReuseIdentifier: MoviesCollectionCell.identifier)
		moviesCollectionView.register(ErrorMovieCollectionViewCell.nib(),
												forCellWithReuseIdentifier: ErrorMovieCollectionViewCell.identifier)
	}
	
	private func fetchMovies() {
		viewModel.delegate = self
		viewModel.getMoviesPopular()
	}
	
}


// MARK: - Extension CollectionView
extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.countMovies
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let movie = viewModel.getMovie(indexPath: indexPath)
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionCell.identifier,
																	 for: indexPath) as? MoviesCollectionCell
		cell?.setupCell(model: movie)
		
		return cell ?? UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (view.frame.size.width/2-15),
						  height: (view.frame.size.width/1.7))
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let movie = viewModel.getMovie(indexPath: indexPath)
		selectItem = indexPath.row
		performSegue(withIdentifier: "movieDetail", sender: movie)
	}
		
}


// MARK: - Extension MovieViewModel
extension MoviesViewController: MovieViewModelProtocol {
	
	func successNetwork() {
		print("==>> Sucesso API")
		DispatchQueue.main.async {
			self.moviesCollectionView.reloadData()
		}
	}
	
	func errorNetwork() {
		print("==>> Erro API")
	}
	
}


// MARK: - Extension MovieDetail
extension MoviesViewController: MovieDetailViewControllerProtocol {
	
	func updateModel(_ model: Movie?) {
		viewModel.updateFavorite(row: selectItem, isFavorite: model?.isFavorite ?? false)
		moviesCollectionView.reloadData()
	}
	
}
