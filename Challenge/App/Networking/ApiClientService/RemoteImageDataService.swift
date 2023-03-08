//
//  RemoteImageDataService.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//

import Foundation

protocol RemoteImageDataService {
    func request(url: URL?) async -> Data?
}
