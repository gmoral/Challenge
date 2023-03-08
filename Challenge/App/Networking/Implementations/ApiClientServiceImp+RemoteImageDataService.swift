//
//  ApiClientServiceImp+RemoteImageDataService.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//
import Foundation

extension ApiClientServiceImp: RemoteImageDataService {
    
    func request(url: URL?) async -> Data? {
        guard let url = url else { return nil }
        
        do {
            let (data: data, request: request) = try await session.data(from: url)
            return (data: data, request: request).data
        } catch {
            return nil
        }
    }
}
