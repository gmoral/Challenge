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
    }
}
