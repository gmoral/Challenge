//
//  CharacterViewModel.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

import Combine

protocol CharacterViewModel: BaseViewModel {
    var itemCharacterCount: Int { get }
    var lastPage: Bool { get }
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel
    func getUrlDetail(row: Int) -> String
    
}

final class CharacterViewModelImp: CharacterViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var lastPage: Bool {
        lastPageValidationUseCase.lastPage
    }
    
    var itemCharacterCount: Int {
        characters.count
    }
    
    private var characters: [Character] = []
    private let loadCharacterUseCase: LoadCharactersUseCase
    private var lastPageValidationUseCase: LastPageValidationUseCase
    private var imageDataUseCase: ImageDataUseCase
    
    init(
        loadCharacterUseCase: LoadCharactersUseCase,
        state: PassthroughSubject<StateController, Never>,
        lastPageValidationUseCase: LastPageValidationUseCase,
        imageDataUseCase: ImageDataUseCase
    ) {
        self.loadCharacterUseCase = loadCharacterUseCase
        self.state = state
        self.lastPageValidationUseCase = lastPageValidationUseCase
        self.imageDataUseCase = imageDataUseCase
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
            lastPageValidationUseCase.updateLastPage(itemsCount: charactersArray.count)
            characters.append(contentsOf: charactersArray)
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
    }
    
    func getItemMenuViewModel(row: Int) -> ItemCharacterViewModel {
        checkAndLoadMoreCharacters(row: row)
        return makeItemCharacterViewModel(row: row)
    }
    
    private func checkAndLoadMoreCharacters(row: Int) {
        lastPageValidationUseCase.checkAndLoadMoreItems(
            row: row,
            actualItems: characters.count,
            action: viewDidLoad)
    }
    
    private func makeItemCharacterViewModel(row: Int) -> ItemCharacterViewModel {
        let character = characters[row]
        return ItemCharacterViewModel(
            character: character,
            dataImageUseCase: imageDataUseCase)
    }
    
    func getUrlDetail(row: Int) -> String {
        let character = characters[row]
        return character.urlCharacter
    }
}
