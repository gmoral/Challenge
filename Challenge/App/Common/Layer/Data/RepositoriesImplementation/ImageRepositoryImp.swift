//
//  ImageRepositoryImp.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//
import Foundation

struct ImageRepositoryImp: ImageDataRepository {
    
    private(set) var remoteDataService: RemoteImageDataService
    private(set) var localDataCache: LocalDataImageService
    
    func fetchData(url: URL?) async -> Data? {
        let data = await remoteDataService.request(url: url)
        localDataCache.save(key: url?.absoluteString ?? .empty, data: data)
        return data
    }
    
    func getFromCache(url: URL?) -> Data? {
        localDataCache.get(key: url?.absoluteString ?? .empty)
    }
}
