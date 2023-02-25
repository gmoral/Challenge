//
//  ViewController.swift
//  Challenge
//
//  Created by Guillermo Moral on 23/02/2023.
// Cmd + A + Crt + I = Format code

import UIKit
import Combine

final class HomeMenuViewController: UICollectionViewController {
    
    private let viewModel : HomeMenuViewModel
    private var cancellable = Set<AnyCancellable>()
    
    init(viewModel: HomeMenuViewModel, layout: UICollectionViewFlowLayout) {
        self.viewModel = viewModel
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
                    self.collectionView.reloadData()
                case .loading:
                    //TODO: Show a loading
                    print("Loading...")
                case .fail(error: let error):
                    //TODO: Show error message
                    print("Error :", error)
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
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.menuItemCount
    }
}
