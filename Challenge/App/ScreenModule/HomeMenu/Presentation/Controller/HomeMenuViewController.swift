//
//  ViewController.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
// Cmd + A + Crt + I = Format code

import UIKit
import Combine

protocol HomeMenuViewControllerCoordinator: AnyObject {
    func didSelectMenuCell(model: MenuEntity)
}

final class HomeMenuViewController: UICollectionViewController {
    private let viewModel: HomeMenuViewModel
    private var cancellable = Set<AnyCancellable>()
    private weak var coordinator: HomeMenuViewControllerCoordinator?
    
    init(
        viewModel: HomeMenuViewModel,
        layout: UICollectionViewFlowLayout,
        coordinator: HomeMenuViewControllerCoordinator
    ) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
        stateController()
        viewModel.viewDidLoad()
    }
    
    private func stateController() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink {state in
                switch state {
                case .success:
                    self.hideSpinner()
                    self.collectionView.reloadData()
                case .loading:
                    self.showSpinner()
                case .fail(error: let error):
                    self.presentAlert(message: error, title: AppLocalized.error)
                }
            }.store(in: &cancellable)
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
override func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier,
                for: indexPath) as? ItemHomeMenuCell
        else {
            return UICollectionViewCell()
        }
        let viewModelCell = viewModel.getItemMenuViewModel(indexPath: indexPath)
        cell.configData(viewModel: viewModelCell)
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        viewModel.menuItemCount
    }
}

extension HomeMenuViewController {
    
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let model = viewModel.getMenuEntity(indexPath: indexPath)
        self.coordinator?.didSelectMenuCell(model: model)
    }
}

extension HomeMenuViewController: SpinnerDisplayable { }

extension HomeMenuViewController: MessageDisplayable { }
