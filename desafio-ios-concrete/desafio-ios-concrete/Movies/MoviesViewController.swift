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

		moviesCollectionView.register(MoviesCollectionCell.nib(),
												forCellWithReuseIdentifier: MoviesCollectionCell.identifier)
	}
	
}


// MARK: - Extension CollectionView
extension MoviesViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 40
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionCell.identifier,
																	 for: indexPath) as? MoviesCollectionCell
		
		return cell ?? UICollectionViewCell()
	}
	
	
}
