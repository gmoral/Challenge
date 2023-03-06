//
//  LoadCharacterUseCase.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

protocol LoadCharactersUseCase {
    func execute() async -> Result<[Character], Error>
}

final class LoadCharactersUseCaseImp: LoadCharactersUseCase {
    private let characterRepository: CharactersRepository
    private var url: String
    private var result: (info: Info, character: [Character])?
    
    init(characterRepository: CharactersRepository, url: String) {
        self.characterRepository = characterRepository
        self.url = url
    }
    
    func execute() async -> Result<[Character], Error> {
        guard !url.isEmpty else { return .success([]) }
        do {
            let respositoryResult = try await characterRepository.fetchCharacters(urlList: url)
            url = respositoryResult.info.next ?? .empty
            return .success(respositoryResult.character)
        }catch {
            return .failure(error)
        }
    }    
}
