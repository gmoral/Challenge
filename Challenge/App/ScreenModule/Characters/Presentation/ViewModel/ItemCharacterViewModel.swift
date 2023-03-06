//
//  ItemCharacterViewModel.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

struct ItemCharacterViewModel {
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var name: String {
        character.name
    }
    
    var specie: String {
        character.specie.description
    }
    
    var status: String {
        character.status?.description ?? ""
    }
    
    
}
