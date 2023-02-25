//
//  SpinnerDisplayable.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

import UIKit

protocol SpinnerDisplayable : AnyObject {
    func showSpinner()
    func hideSpinner()
}

extension SpinnerDisplayable where Self : UIViewController {
    
    func showSpinner() {
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.tag = 100
        containerView.fillSuperView(widthPadding: 0)
        containerView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        
        let spinner = UIActivityIndicatorView()
        containerView.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        if let foundView = view.viewWithTag(100) {
            foundView.removeFromSuperview()
        }
    }
}

