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
    func makeCharacterDetailCoordinator(navigation: UINavigationController, urlDetail: String) -> Coordinator
}

struct CharactersFactoryImp: CharacterFactory {
    let appContainer: AppContainer
    let urlList: String

    func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController {
        let state = PassthroughSubject<StateController, Never>()
        let apiClient = appContainer.apiClient
        let characterRepository = CharacterRepositoryImp(apiClient: apiClient)
        let loadCharacterUseCase = LoadCharactersUseCaseImp(
            characterRepository: characterRepository,
            url: urlList)
        let lastPageValidationUseCase = LastPageValidationUseCaseImp()
        let viewModel = CharacterViewModelImp(
            loadCharacterUseCase: loadCharacterUseCase,
            state: state,
            lastPageValidationUseCase: lastPageValidationUseCase,
            imageDataUseCase: appContainer.getDataImageUseCase()
        )
        let controller = CharacterViewController(viewModel: viewModel, coordinator: coordinator)
        controller.title = "Characters"
        return controller
    }

    func makeCharacterDetailCoordinator(
        navigation: UINavigationController,
        urlDetail: String) -> Coordinator {
            let characterDetailFactory = CharacterDetailFactoryImp(urlDetail: urlDetail, appContainer: appContainer)
        let characterDetailCoordinator = CharacterDetailCoordinator(
            navigation: navigation,
            characterDetailFactory: characterDetailFactory)
        return characterDetailCoordinator
    }
}

// "https://rickandmortyapi.com/api/character/?page=41"
