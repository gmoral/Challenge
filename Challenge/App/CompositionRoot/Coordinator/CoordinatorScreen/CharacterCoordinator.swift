//
//  CharacterCoordinator.swift
//  Challenge
//
//  Created by Guillermo Moral on 03/03/2023.
//

import UIKit

final class CharacterCoordinator: Coordinator {
    var navigation: UINavigationController
    private var characterFactory: CharacterFactory
    init(navigation: UINavigationController, characterFactory: CharacterFactory) {
        self.navigation = navigation
        self.characterFactory = characterFactory
    }
    func start() {
        let controller = characterFactory.makeModule(coordinator: self)
    }
}

extension CharacterCoordinator: CharacterViewControllerCoordinator {
    func didSelectMenuCell(urlDetail: String) {
        print("navigate to detail")
    }
}
