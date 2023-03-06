//
//  ResultsCharactersDTO.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

struct ResultsCharactersDTO: Decodable {
    let info: InfoDTO
    let results: [CharacterDTO]
}
