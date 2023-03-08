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
        navigation.navigationController?.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
}

extension CharacterCoordinator: CharacterViewControllerCoordinator {
    
    func didSelectCell(urlDetail: String) {
        let characterDetailCoordinator = characterFactory.makeCharacterDetailCoordinator(
            navigation: navigation,
            urlDetail: urlDetail)
        characterDetailCoordinator.start()
    }
}
