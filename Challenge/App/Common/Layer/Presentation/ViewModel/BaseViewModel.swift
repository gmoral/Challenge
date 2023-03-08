//
//  BaseViewModel.swift
//  Challenge
//
//  Created by Guillermo Moral on 06/03/2023.
//

import Combine

protocol BaseViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    func viewDidLoad()
}
