//
//  CharacterFactory.swift
//  Challenge
//
//  Created by Guillermo Moral on 03/03/2023.
//
import UIKit
import Combine

protocol CharacterFactory {
    func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController
}

struct CharactersFactoryImp: CharacterFactory {
    let urlList: String
    func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let apiClient = ApiClientServiceImp()
        let characterRepository = CharacterRepositoryImp(apiClient: apiClient)
        let loadCharacterUseCase = LoadCharactersUseCaseImp(
            characterRepository: characterRepository,
            url: urlList)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = CharacterViewModelImp(
            loadCharacterUseCase: loadCharacterUseCase,
            state: state,
            lastPageValidationUseCase: lastPageValidationUseCase)
        let controller = CharacterViewController(viewModel: viewModel)
        controller.title = "Characters"
        return controller
    }
}

// "https://rickandmortyapi.com/api/character/?page=41"
