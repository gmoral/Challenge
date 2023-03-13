//
//  CharacterViewCoordinatorController.swift
//  Challenge
//
//  Created by Guillermo Moral on 03/03/2023.
//

import UIKit
import Combine

protocol CharacterViewControllerCoordinator {
    func didSelectCell(urlDetail: String)
}

final class CharacterViewController: UITableViewController {
    private let viewModel: CharacterViewModel
    private var cancellable = Set<AnyCancellable>()
    private var coordinator: CharacterViewControllerCoordinator

    init(viewModel: CharacterViewModel, coordinator: CharacterViewControllerCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        configTableView()
        stateController()
    }
    
    private func configTableView() {
        tableView.separatorStyle = .none
        tableView.register(
            ItemCharacterTableViewCell.self,
            forCellReuseIdentifier: ItemCharacterTableViewCell.reuseIdentifier)
        addSpinnerLastCell()
    }
    
    private func stateController() {
        viewModel.state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .success:
                    self?.tableView.reloadData()
                case .loading:
                    break
                case .fail(error: let error):
                    self?.presentAlert(message: error, title: AppLocalized.error)
                }
            }.store(in: &cancellable)
    }
    
}

// MARK: - TableViewDataSource
extension CharacterViewController {
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemCharacterTableViewCell.reuseIdentifier,
            for: indexPath) as? ItemCharacterTableViewCell
        else {
            return UITableViewCell()
        }
        let row = indexPath.row
        let itemViewModel = viewModel.getItemMenuViewModel(row: row)
        cell.configData(viewModel: itemViewModel)
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath) {

            tableView.tableFooterView?.isHidden = viewModel.lastPage
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            viewModel.itemCharacterCount
    }
}

extension CharacterViewController {

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let row = indexPath.row
        let urlDetail = viewModel.getUrlDetail(row: row)
        coordinator.didSelectCell(urlDetail: urlDetail)
    }
}

extension CharacterViewController: MessageDisplayable { }
