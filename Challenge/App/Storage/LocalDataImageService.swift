//
//  LocalDataImageService.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//
import Foundation

protocol LocalDataImageService {
    func save(key: String, data: Data?)
    func get(key: String) -> Data?
}

struct LocalDataImageServiceImp: LocalDataImageService {
    private var dataStorage = NSCache<NSString, NSData>()
    
    func save(key: String, data: Data?) {
        guard let data = data else { return }
        dataStorage.setObject(data as NSData, forKey: key as NSString)
    }
    
    func get(key: String) -> Data? {
        dataStorage.object(forKey: key as NSString) as? Data
    }
}
