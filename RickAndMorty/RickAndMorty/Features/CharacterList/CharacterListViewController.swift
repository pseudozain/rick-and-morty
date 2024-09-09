//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import UIKit
import Extensions

class CharacterListViewController: UITableViewController, InstantiableType {
    // MARK: - Properties
    var viewModel: CharacterListViewModelType!
    
    // MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViews()
        viewModel.onViewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

// MARK: - View setup
private extension CharacterListViewController {
    func setupViews() {
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        title = "Characters"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.reuseId)
        tableView.register(LoaderCell.self, forCellReuseIdentifier: LoaderCell.reuseId)
        tableView.register(CharacterListHeaderView.self, forHeaderFooterViewReuseIdentifier: CharacterListHeaderView.reuseId)
    }
}

// MARK: - Binding
private extension CharacterListViewController {
    func bindViews() {
        viewModel.reloadCallback = { [weak self] in self?.tableView.reloadData() }
    }
}

// MARK: - Table view data source & delegate
extension CharacterListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cellViewModelForRow(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.reuseIdentifier)
        cell?.configure(with: cellViewModel)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerViewModel = viewModel.headerViewModel(for: section)
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewModel.reuseIdentifier)
        header?.configure(with: headerViewModel)
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedRow(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.willDisplayCell(for: indexPath)
    }
}
