//
//  MenuDTO+Mapper.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

extension MenuDTO {
    func toDomain() -> [MenuEntity] {
        return self.dictionaryProperty().map { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? String()
            return MenuEntity(title: title, url: url)
        }
    }
}
