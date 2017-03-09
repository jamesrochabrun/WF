//
//  ScheduleVCDataSource.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol ScheduleVCDataSourceDelegate: class {
    func showPartySizePickerInVC()
}

class ScheduleVCDataSource: NSObject, UICollectionViewDataSource {
    
    private let calendarCellID = "calendarID"
    private let timeCellID = "timeCellID"
    private let headerID = "headerID"
    
    weak var delegate: ScheduleVCDataSourceDelegate?
    var service: Service?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendarCellID, for: indexPath) as! CalendarCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timeCellID, for: indexPath) as! TimeCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let scheduleHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! ScheduleHeaderCell
        scheduleHeaderView.delegate = self
        if let service = self.service {
            scheduleHeaderView.setUpHeaderWith(service: service)
        }
        return scheduleHeaderView
    }
}

extension ScheduleVCDataSource: ScheduleHeaderCellDelegate {
    
    func showPartySizePicker() {
        delegate?.showPartySizePickerInVC()
    }
}
