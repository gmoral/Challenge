//
//  MessageDisplayable.swift
//  Challenge
//
//  Created by Guillermo Moral on 01/03/2023.
//
import UIKit

protocol MessageDisplayable {}

extension MessageDisplayable where Self: UIViewController {
    func presentAlert(message: String, Title: String) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
