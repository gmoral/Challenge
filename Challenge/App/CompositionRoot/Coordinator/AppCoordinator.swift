//
//  AppCoordinator.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    private let appFactory: AppFactory
    private var homeCoordinator: Coordinator?
    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?) {
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    func start() {
        homeCoordinator = appFactory.makeHomeCoordinator(navigation: navigation)
        homeCoordinator?.start()
    }
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
