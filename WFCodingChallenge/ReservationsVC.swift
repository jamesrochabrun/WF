//
//  ViewController.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
@available(iOS 10.0, *)


class ReservationsVC: UICollectionViewController {

    // MARK: - UI Variables
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(showSpaServiceVC))
        
    }
    
    // MARK: - setUp UI
    
    // MARK: - setUp Layout


    // MARK: - Navigation
    func showSpaServiceVC() {
        
        let discountPageVC = DiscountPageController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        let navVC = UINavigationController(rootViewController: discountPageVC)
        self.present(navVC, animated: true)
    }

    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





