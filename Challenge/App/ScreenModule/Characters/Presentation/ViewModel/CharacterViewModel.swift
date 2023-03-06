//
//  CharacterViewModel.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

import Combine

protocol CharacterViewModel:  BaseViewModel {
    var itemCharacterCount: Int { get }
    var lastPage: Bool { get }
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel
    func getUrlList(row: Int) -> String
    
}

final class CharacterViewModelImp: CharacterViewModel {
    var state: PassthroughSubject<StateController, Never>
    var lastPage: Bool = false
    private var characters: [Character] = []
    private let loadCharacterUseCase: LoadCharactersUseCase
    
    var itemCharacterCount: Int {
        characters.count
    }
    
    init(
        loadCharacterUseCase: LoadCharactersUseCase,
        state: PassthroughSubject<StateController, Never>
    ) {
        self.loadCharacterUseCase = loadCharacterUseCase
        self.state = state
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            await loadCharactersUseCase()
        }
    }
    
    private func loadCharactersUseCase() async {
        let resultUseCase = await loadCharacterUseCase.execute()
        updateStateUI(resultUseCase: resultUseCase)
    }
    
    private func updateStateUI(resultUseCase: Result<[Character], Error>) {
        switch resultUseCase {
        case .success(let charactersArray):
            characters.append(contentsOf: charactersArray)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel {
        let character = characters[row]
        let itemCharacterViewModel = ItemCharacterViewModel(character: character)
        return itemCharacterViewModel
    }
    
    func getUrlList(row: Int) -> String {
        let character = characters[row]
        return character.urlCharacter
    }
}
