//
//  MenuRepositoryImp.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

import Foundation

struct MenuRepositoryImp : MenuRepository {
    
    let apiClientService: ApiClientService
    let urlList: String
    
    func fetchMenuData() async throws -> [MenuEntity] {
        let url = URL(string: urlList)
        
        return try await apiClientService.request(url: url, type: MenuDTO.self).toDomain()
    }
}
