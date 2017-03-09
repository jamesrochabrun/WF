//
//  TimeDataSource.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class TimeDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK:- Private constants
    private let cellID = "cellID"
    private let dataSource = BusinessHours()
    private let dateFormatter = DateFormatter()

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HourCell
        
        // dateFormatter indicates how the string will look like
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let hours = dataSource.getBusinessHours()
        cell.hourLabel.text = dateFormatter.string(from: hours[indexPath.item])
        cell.checkImageView.alpha = cell.isSelected ? 0.75 : 0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.getBusinessHours().count
    }
}
