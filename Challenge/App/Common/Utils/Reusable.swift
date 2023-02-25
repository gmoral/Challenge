//
//  Ruesable.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self) }
}
