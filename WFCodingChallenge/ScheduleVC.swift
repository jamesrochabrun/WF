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
    private let scheduleDataSource = ScheduleVCDataSource()
    
    //MARK: - UI Components
    let partyPickerView: ViewPartyPicker = {
        let vpv = ViewPartyPicker()
        vpv.alpha = 0
        return vpv
    }()

    //MARK: - APP Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        scheduleDataSource.service = service
        scheduleDataSource.delegate = self
        collectionView?.dataSource = scheduleDataSource
        collectionView?.register(ScheduleHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView?.register(CalendarCell.self, forCellWithReuseIdentifier: calendarCellID)
        collectionView?.register(TimeCell.self, forCellWithReuseIdentifier: timeCellID)
        collectionView?.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
        setUpViews()
    }
    
    //MARK: - Set Up UI
    func setUpViews() {
        view.addSubview(partyPickerView)
        partyPickerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        partyPickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        partyPickerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        partyPickerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}

//MARK: - FlowLayout delegate methods
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

//MARK: ScheduleVCDataSourceDelegate method
extension ScheduleVC: ScheduleVCDataSourceDelegate {
    func showPartySizePickerInVC() {
        partyPickerView.alpha = 1
    }
}














