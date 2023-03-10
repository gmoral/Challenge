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
        view.layer.cornerRadius = ViewValues.defaultCornerRadius
        view.layer.masksToBounds = true
        return view
    }()

    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let titleCategoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = AppLocalized.category
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
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
        mainContainer.fillSuperView(widthPadding: ViewValues.normalPadding)
        mainContainer.addSubview(categoryImageView)
        categoryImageView.fillSuperView()
        configGradientForTitle()
        mainContainer.addSubview(titleCategoryLabel)
        titleCategoryLabel.setConstraints(right: mainContainer.rightAnchor,
                                          bottom: mainContainer.bottomAnchor,
                                          left: mainContainer.leftAnchor,
                                          pRight: ViewValues.defaultCornerRadius,
                                          pBottom: ViewValues.normalPadding,
                                          pLeft: ViewValues.normalPadding)
    }

    private func configGradientForTitle() {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = self.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
        gradientMaskLayer.locations = [ViewValues.gradientTitleInit, ViewValues.gradientTitleEnd]
        mainContainer.layer.addSublayer(gradientMaskLayer)
    }
    
    public func configData(viewModel: ItemHomeMenuViewModel) {
        titleCategoryLabel.text = viewModel.title
        categoryImageView.image = UIImage(named: viewModel.title.lowercased())
    }
}

extension ItemHomeMenuCell: Reusable { }
