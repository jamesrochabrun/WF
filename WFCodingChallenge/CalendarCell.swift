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
    
    //MARK: - private constant
    fileprivate let cellID = "cellID"
    private let calendarDataSource = CalendarDataSource()
    
    //MARK: - UI Component
    lazy var dateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.alwaysBounceHorizontal = true
        cv.contentInset = UIEdgeInsetsMake(0, Constants.UI.scheduleViewPaddingSmall, 0, Constants.UI.scheduleViewPaddingSmall)
        cv.register(DateCell.self, forCellWithReuseIdentifier: self.cellID)
        return cv
    }()
    
    let monthLabel: UILabel  = {
        let label = UILabel()
        label.with(text: "APRIL", font: Constants.Font.medium, fontSize: 13, textColor: Constants.Color.textcolorDark1)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    let viewCalendarLabel: UILabel = {
        let label = UILabel()
        label.with(text: "View Calendar", font:  Constants.Font.medium, fontSize: 12, textColor: Constants.Color.doActionColor)
        return label
    }()
    
    
    //MARK: - Set Up UI
    override func setupViews() {
        addSubview(dateCollectionView)
        dateCollectionView.dataSource = calendarDataSource
        
        //changing the mainMultiplier will resize dinamycally all the content of the cell, suggested range between 0.6 and 0.7 to satisfy monthLabel and viewCalendarLabel heights
        let mainMultiplier: CGFloat = 0.63
        dateCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: mainMultiplier).isActive = true
        dateCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        dateCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dateCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        
        addSubview(monthLabel)
        monthLabel.bottomAnchor.constraint(equalTo: dateCollectionView.topAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        monthLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        monthLabel.widthAnchor.constraint(equalToConstant: Constants.UI.calendarLabelWidth).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: Constants.UI.calendarLabelHeight).isActive = true
        
        addSubview(viewCalendarLabel)
        viewCalendarLabel.bottomAnchor.constraint(equalTo: monthLabel.bottomAnchor).isActive = true
        viewCalendarLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        viewCalendarLabel.heightAnchor.constraint(equalToConstant: Constants.UI.calendarLabelHeight).isActive = true
    }
}


//MARK: - CalendarCell delegate and flowLayout protocols
extension CalendarCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //0.73 keeps the aspect ratio of the design
        let size = CGSize(width: dateCollectionView.frame.height * 0.73 , height: dateCollectionView.frame.height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        guard let cell = collectionView.cellForItem(at: indexPath) as? DateCell else {
            return
        }
        UIView.animate(withDuration: 0.3, animations: {
            cell.checkImageView.alpha = 0.75
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? DateCell else {
            return //the cell is not visible
        }
        UIView.animate(withDuration: 0.3, animations: {
            cell.checkImageView.alpha = 0
        })
    }
}

//MARK: Cell inside the datecollectionView
class DateCell: BaseCollectionViewCell {
        
    //MARK: - UIComponents
    let blueView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.doActionColor)
        return v
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.with(text: "TUE", font: Constants.Font.regular, fontSize: 11, textColor: Constants.Color.textColorGray1)
        label.textAlignment = .center
        return label
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.with(text: "04", font: Constants.Font.medium, fontSize: 20, textColor: Constants.Color.textColorGray1)
        label.textAlignment = .center
        return label
    }()
    
    let checkImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = #imageLiteral(resourceName: "checkmarkOutline")
        iv.alpha = 0
        iv.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.doActionColor)
        return iv
    }()
    
    //MARK: - set Up Components
    override func setupViews() {
        
        layer.borderColor = UIColor.hexStringToUIColor(Constants.Color.dotGray).cgColor
        layer.borderWidth = 1.0
        clipsToBounds = true
        backgroundColor = .white
        
        addSubview(blueView)
        blueView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blueView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        //0.2 is applied to satisfy the design, the top blue view is the 20% of the cell
        blueView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        blueView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        addSubview(numberLabel)
        numberLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        //0.25 is applied to satisfy the design, the label adjusts dynamically based on its superview
        numberLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
        numberLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(frame.height * 0.2)).isActive = true
        numberLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        addSubview(dayLabel)
        dayLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        //0.22 is applied to satisfy the design, the label adjusts dynamically based on its superview
        dayLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.22).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: numberLabel.topAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        addSubview(checkImageView)
        checkImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        checkImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        checkImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        checkImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}

























