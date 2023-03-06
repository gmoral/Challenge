//
//  HomeCoordinator.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//
import UIKit

enum Screen: String {
    case characters
    case episodes
    case locations
}

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    init(navigation: UINavigationController, homeFactory: HomeFactory) {
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    func start() {
        let controller = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

extension HomeCoordinator: HomeMenuViewControllerCoordinator {
    func didSelectMenuCell(model: MenuEntity) {
        switch model.title {
        case Screen.characters.rawValue:
            goToCharacters(urlList: model.url)
        case Screen.episodes.rawValue:
            goToEpisodes()
        case Screen.locations.rawValue:
            goToLocation()
        default:
            break
        }
    }
    
    private func goToCharacters(urlList: String) {
        let coordinator = homeFactory.makeCoordinatorCharacters(
            navigation: navigation,
            urlList: urlList)
        coordinator.start()
    }
    
    private func goToEpisodes() {
        print("got to episodes")
    }
    
    private func goToLocation() {
        print("got to location")
    }
}
