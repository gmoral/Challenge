//
//  ItemHomeMenuViewModel.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

struct ItemHomeMenuViewModel {
    private let menuEntity : MenuEntity
    
    init(menuEntity: MenuEntity) {
        self.menuEntity = menuEntity
    }
    
    var title: String {
        menuEntity.title.capitalized
    }
    
    var imageName: String {
        menuEntity.title
    }
}
