//
//  StatusCharacter.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

enum StatusCharacter: String {
    case alive
    case deed
    case unknow
    
    init?(status: String?) {
        guard let status = StatusCharacter(rawValue: status?.lowercased() ?? .empty)
        else {
            return nil
        }
        self = status
    }
}

extension StatusCharacter: CustomStringConvertible {
    var description: String {
        switch self {
            
        case .alive:
            return AppLocalized.statusAlive
        case .deed:
            return AppLocalized.statusDead
        case .unknow:
            return AppLocalized.statusUnknown
        }
    }
}
