//
//  ImageDataRepository.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//
import Foundation

protocol ImageDataRepository {
    func fetchData(url: URL?) async -> Data?
    func getFromCache(url: URL?) -> Data?
}
