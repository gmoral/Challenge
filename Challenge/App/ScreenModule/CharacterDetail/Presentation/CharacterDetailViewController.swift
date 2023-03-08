//
//  CharacterDetailViewController.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//

import UIKit

protocol CharacterDetailViewControllerCoordinator {

}

final class CharacterDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUserInterface()
    }

    func configUserInterface() {
        view.backgroundColor = .red
    }
}
