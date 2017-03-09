//
//  CalendarView.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class CalendarView: BaseView {
    
    //MARK: - private constant
    fileprivate let cellID = "cellID"
    private let calendarDataSource = CalendarDataSource()
    
    //MARK: - UI Component
    lazy var dateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.alwaysBounceHorizontal = false
        cv.alwaysBounceVertical = false
        cv.contentInset = UIEdgeInsetsMake(0, Constants.UI.scheduleViewPaddingSmall, 0, Constants.UI.scheduleViewPaddingSmall)
        cv.register(DateCell.self, forCellWithReuseIdentifier: self.cellID)
        return cv
    }()
    
    lazy var containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.textColorDark)
        v.alpha = 0.8
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSelf)))
        return v
    }()
    
    let monthLabel: UILabel = {
        let l = UILabel()
        l.with(text: Date().getMonth().uppercased(), font: Constants.Font.thin, fontSize: 30, textColor: Constants.Color.dotWhite)
        l.textAlignment = .center
        return l
    }()
    
    //MARK: SET Up UI
    override func setUpViews() {
        
        addSubview(containerView)
        containerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(dateCollectionView)
        dateCollectionView.dataSource = calendarDataSource
        dateCollectionView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        dateCollectionView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        dateCollectionView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        dateCollectionView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 20).isActive = true
        
        addSubview(monthLabel)
        monthLabel.bottomAnchor.constraint(equalTo: dateCollectionView.topAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        monthLabel.widthAnchor.constraint(equalTo: dateCollectionView.widthAnchor).isActive = true
        monthLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    //MARK: handle selectors
    func hideSelf() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        })
    }
}
