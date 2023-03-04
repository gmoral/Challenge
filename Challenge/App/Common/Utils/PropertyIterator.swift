//
//  PropertyIterator.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

protocol PropertyIterator { }

extension PropertyIterator {
    func dictionaryProperty() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary: [String: Any] = [:]
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        return dictionary
    }
}
