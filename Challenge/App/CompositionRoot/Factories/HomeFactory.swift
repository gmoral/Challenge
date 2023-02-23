//
//  HomeFactory.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//
import UIKit

protocol HomeFactory {
    func makeModule()-> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule() -> UIViewController {
        let homeMenuViewController = HomeMenuViewController()
        homeMenuViewController.title = "Challenge"
        
        return homeMenuViewController
    }
}
