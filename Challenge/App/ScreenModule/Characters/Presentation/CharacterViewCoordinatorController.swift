//
//  CharacterViewCoordinatorController.swift
//  Challenge
//
//  Created by Guillermo Moral on 03/03/2023.
//

import UIKit

protocol CharacterViewControllerCoordinator {
    func didSelectMenuCell(urlDetail: String)
}

final class CharacterViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        tableView.separatorStyle = .none
        tableView.register(
            ItemCharacterTableViewCell.self,
            forCellReuseIdentifier: ItemCharacterTableViewCell.reuseIdentifier)
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
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        10
    }
}
