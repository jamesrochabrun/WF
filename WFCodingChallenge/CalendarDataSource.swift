//
//  CalendarDataSource.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class CalendarDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK: - 
    private let cellID = "cellID"
    let dates: [Date] = Date().getAllDaysInMonth()
    private let dateFormatter = DateFormatter()
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! DateCell
        dateFormatter.dateFormat = "EEE"
        cell.dayLabel.text = dateFormatter.string(from: dates[indexPath.item])
        cell.numberLabel.text = String(indexPath.row + 1)
        cell.checkImageView.alpha = cell.isSelected ? 0.75 : 0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dates.count
    }
}

