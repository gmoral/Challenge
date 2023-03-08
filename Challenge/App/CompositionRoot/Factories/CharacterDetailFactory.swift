//
//  CharacterDetailFactory.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//
import UIKit

protocol CharacterDetailFactory {
    
    func makeModel(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController

}

struct CharacterDetailFactoryImp: CharacterDetailFactory {
    let urlDetail: String
    let appContainer: AppContainer

    func makeModel(coordinator: CharacterDetailViewControllerCoordinator) -> UIViewController {
        let controller = CharacterDetailViewController()
        return controller
    }
}
