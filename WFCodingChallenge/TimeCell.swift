//
//  TimeCell.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import  UIKit


class TimeCell: CalendarCell {
    
    //MARK: - private constants
    private let cellID = "cellID"
    
    
    //MARK: - set Up UI for TimeCell
    override func setupViews() {
        
        addSubview(dateCollectionView)
        addSubview(monthLabel)
    
        viewCalendarLabel.isHidden = true
        monthLabel.text = "AVAILABLE TIMES"
        dateCollectionView.register(HourCell.self, forCellWithReuseIdentifier: cellID)
        
        //changing the mainMultiplier will resize dinamycally all the content of the cell, suggested range between 0.7 and 0.8 to satisfy monthLabel height
        let mainMultiplier: CGFloat = 0.75
        dateCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: mainMultiplier).isActive = true
        dateCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        dateCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.UI.scheduleViewPaddingBig).isActive = true
        dateCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        
        monthLabel.bottomAnchor.constraint(equalTo: dateCollectionView.topAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        monthLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        monthLabel.widthAnchor.constraint(equalToConstant: Constants.UI.calendarLabelWidth).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: Constants.UI.calendarLabelHeight).isActive = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //number of rows are based on the design, 7 is to give some space the collectionView
        let numberOfRows: CGFloat = 3
        return CGSize(width: Constants.UI.timeCellWidth, height: collectionView.frame.height / numberOfRows - 7)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HourCell
        return cell
    }
}

//MARK: - this cell will be used in the horizontal collectionView (dateCollectionView)

class HourCell: BaseCollectionViewCell {
    
    //MARK: - UI Components
    let hourLabel: UILabel = {
        let label = UILabel()
        label.with(text: "12: 00PM", font: Constants.Font.regular, fontSize: 11, textColor: Constants.Color.textColorGray1)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Set Up UI for HourCell
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        layer.borderColor = UIColor.hexStringToUIColor(Constants.Color.dotGray).cgColor
        layer.borderWidth = 1.0
        addSubview(hourLabel)
        hourLabel.sizeToFit()
        hourLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hourLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}











