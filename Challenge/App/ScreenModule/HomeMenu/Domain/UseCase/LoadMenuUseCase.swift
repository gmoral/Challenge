//
//  LoadMenuUseCase.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

protocol LoadMenuUseCase {
    func execute() async -> Result<[MenuEntity], Error>
}

struct LoadMenuUseCaseImp : LoadMenuUseCase {
    
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuEntity], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
}
