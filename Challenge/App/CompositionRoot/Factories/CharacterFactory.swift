//
//  CharacterFactory.swift
//  Challenge
//
//  Created by Guillermo Moral on 03/03/2023.
//
import UIKit

protocol CharacterFactory {
    func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController
}

struct CharactersFactoryImp: CharacterFactory {
    func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController {
        let controller = CharacterViewController()
        controller.title = "Characters"
        return controller
    }
}
