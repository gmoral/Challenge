//
//  LocationDTO.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

struct LocationDTO: Decodable {
    let name: String
    let type: String?
    let dimension: String?
    let url: String
}
