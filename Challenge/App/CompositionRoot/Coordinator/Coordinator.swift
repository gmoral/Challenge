//
//  Coordinator.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//
import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
