//
//  Specie.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

enum Specie {
    case alien
    case human
    case other(type: String?)
    
    init(specie: String?) {
        switch specie {
        case AppLocalized.alien:
            self = .alien
        case AppLocalized.human:
            self = .human
        default:
            self = .other(type: specie)
            
        }
    }
}

extension Specie: CustomStringConvertible {
    var description: String {
        switch self {
            
        case .alien:
            return AppLocalized.specieAlien
        case .human:
            return AppLocalized.specieHuman
        case .other(let typeSpecie):
            let typeSpecie = typeSpecie ?? AppLocalized.unknown
            return "\(AppLocalized.specie) \(typeSpecie)"
        }
    }
}
