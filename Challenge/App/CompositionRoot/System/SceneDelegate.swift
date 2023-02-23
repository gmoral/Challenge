//
//  SceneDelegate.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: Coordinator!
    var appFactory : AppFactory!
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let navigation = UINavigationController()
        appFactory = AppFactoryImp()
        window = UIWindow(windowScene: scene)
        appCoordinator = AppCoordinator(navigation: navigation, appFactory: appFactory, window: window)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}

