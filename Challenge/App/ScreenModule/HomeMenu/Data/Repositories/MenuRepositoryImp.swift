//
//  MenuRepositoryImp.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

struct MenuRepositoryImp : MenuRepository {
    func fetchMenuData() async throws -> [MenuEntity] {
        [MenuEntity(title: "locations", url: "none")]
    }
}
