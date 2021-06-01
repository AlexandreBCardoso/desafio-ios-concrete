//
//  FavoriteViewController.swift
//  desafio-ios-concrete
//
//  Created by Alexandre Cardoso on 30/05/21.
//

import UIKit

class FavoriteViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var favoriteTableView: UITableView!
	
	// MARK: - Variable
	private let viewModel: FavoriteViewModel = FavoriteViewModel()
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTableView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupFavorite()
	}
	
	
	// MARK: - Function
	private func setupTableView() {
		favoriteTableView.dataSource = self
		favoriteTableView.delegate = self
		favoriteTableView.separatorStyle = .none
		favoriteTableView.register(FavoriteTableViewCell.nib(),
											forCellReuseIdentifier: FavoriteTableViewCell.identifier)
		favoriteTableView.register(NoFavoriteTableViewCell.nib(),
											forCellReuseIdentifier: NoFavoriteTableViewCell.identifier)
	}
	
	private func setupFavorite() {
		viewModel.fetchFavorite()
		favoriteTableView.reloadData()
	}
	
}


// MARK: - Extension TableView
extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.countFavorite()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if viewModel.checkListFavoriteEmpty() {
			let cell = tableView.dequeueReusableCell(withIdentifier: NoFavoriteTableViewCell.identifier,
																  for: indexPath) as? NoFavoriteTableViewCell
			return cell ?? UITableViewCell()
		}
		
		let favorite = viewModel.getFavorite(indexPath: indexPath)
		let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier,
															  for: indexPath) as? FavoriteTableViewCell
		
		cell?.setupCell(model: favorite)
		return cell ?? UITableViewCell()
	}
		
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let deleteAction = UIContextualAction(style: .destructive, title: "Unfavorite") { (action, view, handler) in
			self.viewModel.deleteFavorite(indexPath: indexPath)
			self.viewModel.fetchFavorite()
			self.favoriteTableView.reloadData()
		}
		
		deleteAction.backgroundColor = .red
		let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
		return configuration
		
	}
	
	
}
