//
//  CalendarCell.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class CalendarCell: BaseCollectionViewCell {
        
    override func setupViews() {
         backgroundColor = .orange
    }
    
    lazy var appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.alwaysBounceHorizontal = true
        cv.contentInset = UIEdgeInsetsMake(0, Constants.UI.padding, 0, Constants.UI.padding)
        cv.register(AppCell.self, forCellWithReuseIdentifier: self.cellID)
        return cv
    }()
    
}



