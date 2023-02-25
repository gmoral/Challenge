//
//  MenuDTO.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

struct MenuDTO: Decodable {
    let characters: String
    let locations: String
    let episodes: String
}

extension MenuDTO: PropertyIterator {
    
}
