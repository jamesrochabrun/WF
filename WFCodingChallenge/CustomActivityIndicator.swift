//
//  CustomActivityIndicator.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/10/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class CustomActivityIndicator: BaseView {

    //MARK: UI Components
    private let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.alpha = 0.5
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.doActionColor)
        return v
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let actInd = UIActivityIndicatorView()
        actInd.hidesWhenStopped = true
        actInd.translatesAutoresizingMaskIntoConstraints = false
        actInd.activityIndicatorViewStyle = .whiteLarge
        actInd.startAnimating()
        return actInd
    }()
    
    override func setUpViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        containerView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
        containerView.addSubview(activityIndicator)
        activityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
    
    //MARK: Stop and hide 
    func stopAnimating() {
        activityIndicator.stopAnimating()
        alpha = 0
    }
}





