//
//  ItemHomeMenuCell.swift
//  Challenge
//
//  Created by Guillermo Moral on 24/02/2023.
//

import UIKit

final class ItemHomeMenuCell: UICollectionViewCell {
    
    private let mainContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    
    private let characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        addSubview(mainContainer)
        mainContainer.fillSuperView(widthPadding: 10)
        mainContainer.addSubview(characterImage)
        characterImage.fillSuperView()
    }
}

extension ItemHomeMenuCell: Reusable {
    
}
