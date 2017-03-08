//
//  ScheduleVC.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ScheduleVC: UICollectionViewController {
    
    //MARK: - Constants and Variables
    var service: Service?
    private let headerID = "headerID"
    private let calendarCellID = "calendarID"
    private let timeCellID = "timeCellID"
    
    //MARK: - APP Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(ScheduleHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView?.register(CalendarCell.self, forCellWithReuseIdentifier: calendarCellID)
        collectionView?.register(TimeCell.self, forCellWithReuseIdentifier: timeCellID)
        collectionView?.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendarCellID, for: indexPath) as! CalendarCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timeCellID, for: indexPath) as! TimeCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let scheduleHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! ScheduleHeaderCell
        if let service = self.service {
            scheduleHeaderView.setUpHeaderWith(service: service)
        }
        return scheduleHeaderView
    }
}

extension ScheduleVC: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: Constants.UI.calendarCellHeight)
        }
        return CGSize(width: view.frame.width, height: Constants.UI.timeCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: Constants.UI.scheduleHeaderHeight)
    }    
}




