//
//  HomeFactory.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//
import UIKit
import Combine

protocol HomeFactory {
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController
    func makeCoordinatorCharacters(navigation: UINavigationController, urlList: String) -> Coordinator
}

struct HomeFactoryImp: HomeFactory {
    
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuViewController = HomeMenuViewController(viewModel: homeMenuViewModel,
                                                            layout: makeLayout(),
                                                            coordinator: coordinator)
        homeMenuViewController.title = AppLocalized.appName
        return homeMenuViewController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (ViewValues.widthScreen  - ViewValues.doublePadding) *  ViewValues.multiplier
        let layoutHeight = (ViewValues.widthScreen  - ViewValues.doublePadding) * ViewValues.multiplier
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: ViewValues.normalPadding,
                                           bottom: .zero,
                                           right: ViewValues.normalPadding)
        return layout
    }
    
    func makeCoordinatorCharacters(navigation: UINavigationController, urlList: String) -> Coordinator {
        let characterFactory = CharactersFactoryImp()
        let characterCoordinator = CharacterCoordinator(navigation: navigation, characterFactory: characterFactory)
        return characterCoordinator
    }
}
