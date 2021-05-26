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
	
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupSearchController()
		setupCollectionView()
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
	
}


// MARK: - Extension CollectionView
extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 40
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionCell.identifier,
																	 for: indexPath) as? MoviesCollectionCell
		
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
		print("Selecionado: \(indexPath.row)")
		performSegue(withIdentifier: "movieDetail", sender: nil)
	}
		
}
