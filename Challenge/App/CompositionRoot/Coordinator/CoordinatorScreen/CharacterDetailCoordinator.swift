//
//  CharacterDetailCoordinator.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//

import UIKit

final class CharacterDetailCoordinator: Coordinator {

    var navigation: UINavigationController
    private var characterDetailFactory: CharacterDetailFactory

    init(navigation: UINavigationController,
         characterDetailFactory: CharacterDetailFactory
    ) {
        self.navigation = navigation
        self.characterDetailFactory = characterDetailFactory
    }

    func start() {
        let controller = characterDetailFactory.makeModel(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

extension CharacterDetailCoordinator: CharacterDetailViewControllerCoordinator {

}
