//
//  ImageDataUseCase.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//

import Foundation

protocol ImageDataUseCase {
    func getData(url: URL?) async -> Data?
    func getDataFromCache(url: URL?) -> Data?
}

struct ImageDataUseCaseImp: ImageDataUseCase {
    private(set) var imageDataRepository: ImageDataRepository
    
    func getData(url: URL?) async -> Data? {
        await imageDataRepository.fetchData(url: url)
    }
    
    func getDataFromCache(url: URL?) -> Data? {
        imageDataRepository.getFromCache(url: url)
    }
    
}
