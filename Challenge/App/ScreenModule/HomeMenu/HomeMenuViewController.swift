//
//  ViewController.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
//

import UIKit

final class HomeMenuViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
    }

    private func configUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configCollectionView() {
        print(ItemHomeMenuCell.reuseIdentifier)
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
    }
}

extension HomeMenuViewController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier,
                for: indexPath) as? ItemHomeMenuCell
        else {
            return UICollectionViewCell()
            
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
}
