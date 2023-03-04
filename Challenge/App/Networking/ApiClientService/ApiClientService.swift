//
//  ApiClientService.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

import Foundation

protocol ApiClientService {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
