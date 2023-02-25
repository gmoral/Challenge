//
//  MenuRepository.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuEntity]
}
