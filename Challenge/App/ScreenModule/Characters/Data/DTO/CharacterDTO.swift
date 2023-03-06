//
//  CharacterDTO.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let status: String?
    let species: String?
    let image: String?
    let url: String
    let origin: OriginDTO
    let location: LocationDTO    
}
