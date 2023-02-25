//
//  HomeFactory.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//
import UIKit
import Combine

protocol HomeFactory {
    func makeModule()-> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    func makeModule() -> UIViewController {
        
        let menuRepository = MenuRepositoryImp()
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        
        let homeMenuViewController = HomeMenuViewController(viewModel: homeMenuViewModel, layout: makeLayout())
        
        homeMenuViewController.title = "Challenge"
        
        return homeMenuViewController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (UIScreen.main.bounds.width  - 20 ) * 0.5
        let layoutHeight = (UIScreen.main.bounds.width - 20) * 0.5
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
    
}
