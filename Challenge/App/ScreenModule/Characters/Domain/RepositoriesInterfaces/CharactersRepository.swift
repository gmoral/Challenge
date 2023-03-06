//
//  CharactersRepository.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

protocol CharactersRepository {
    func fetchCharacters(
        urlList: String
    ) async throws -> (info: Info, character: [Character])
}
