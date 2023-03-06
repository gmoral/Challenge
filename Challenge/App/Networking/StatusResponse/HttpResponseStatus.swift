//
//  HttpResponseStatus.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

enum HttpResponseStatus {
    static let dataok = 200...299
    static let clientError = 400...499
    static let serverError = 500...599
}
