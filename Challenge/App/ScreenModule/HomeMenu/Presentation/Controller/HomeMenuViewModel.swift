//
//  HomeMenuViewModel.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

import Combine
import Foundation

protocol HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemCount: Int { get }
    func viewDidLoad()
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel
    func getMenuEntity(indexPath: IndexPath) -> MenuEntity
}

final class HomeMenuViewModelImp: HomeMenuViewModel {

    var state: PassthroughSubject<StateController, Never>

    var menuItemCount: Int {
        menuEntities.count
    }

    private let loadMenuUseCase: LoadMenuUseCase
    private var menuEntities: [MenuEntity] = []
    init(state: PassthroughSubject<StateController, Never>, loadMenuUseCase: LoadMenuUseCase) {
        self.state = state
        self.loadMenuUseCase = loadMenuUseCase
    }

    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result = await loadMenuUseCase.execute()
            updateUI(result: result)
        }
    }

    private func updateUI(result: Result<[MenuEntity], Error>) {
        switch result {
        case .success(let menuEntities):
            self.menuEntities = menuEntities
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }

    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel {
        let menuEntity = menuEntities[indexPath.row]
        return ItemHomeMenuViewModel(menuEntity: menuEntity)
    }
    
    func getMenuEntity(indexPath: IndexPath) -> MenuEntity {
        menuEntities[indexPath.row]
    }
}
