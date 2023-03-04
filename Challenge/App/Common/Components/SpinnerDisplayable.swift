//
//  SpinnerDisplayable.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
    func showSpinner()
    func hideSpinner()
}

extension SpinnerDisplayable where Self: UIViewController {
    func showSpinner() {
        guard doesNotExistAnotherSpinner else { return }
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.tag = ViewValues.tagIdentifierSpinner
        containerView.fillSuperView(widthPadding: 0)
        containerView.backgroundColor = UIColor.red.withAlphaComponent(ViewValues.opacityContainerSpinner)
        addSpinnerIndicatorToContainer(containerView: containerView)
    }
    private func addSpinnerIndicatorToContainer(containerView: UIView) {
        let spinner = UIActivityIndicatorView()
        containerView.addSubview(spinner)
        spinner.setCenterConstraints(parent: containerView)
        spinner.startAnimating()
    }
    func hideSpinner() {
        if let foundView = view.viewWithTag(ViewValues.tagIdentifierSpinner) {
            foundView.removeFromSuperview()
        }
    }
    private var doesNotExistAnotherSpinner: Bool {
        view.viewWithTag(ViewValues.tagIdentifierSpinner) == nil
    }
}
