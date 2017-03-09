//
//  ScheduleVC.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ScheduleVC: UICollectionViewController {
    
    //MARK: - Constants and Variables
    var service: Service?
    fileprivate let headerID = "headerID"
    fileprivate let calendarCellID = "calendarID"
    fileprivate let timeCellID = "timeCellID"
    
    //MARK: - Global variables and constants
    let monthString = Date().getMonth()
    let yearString = Date().getCurrentYear()
    var numberDayString: String?
    var weekDayString: String?
    var partySize: String?
    var hourString: String?
    
    //periodoftime
    //descriptio
    //title
    
    //MARK: - UI Components
    let partyPickerView: ViewPartyPicker = {
        let vpv = ViewPartyPicker()
        vpv.alpha = 0
        return vpv
    }()
    
    lazy var reservationButton: UIButton = {
        let b = UIButton()
        if #available(iOS 10.0, *) {
            b.with(title: "Reserve", target: self, selector: #selector(constructAndSaveInCoreData), cornerRadius: 0, font: Constants.Font.medium, fontSize: 16, color: Constants.Color.doActionColor, titleColor: Constants.Color.dotWhite)
        } else {
            // Fallback on earlier versions
        }
        return b
    }()

    //MARK: - APP Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(ScheduleHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView?.register(CalendarCell.self, forCellWithReuseIdentifier: calendarCellID)
        collectionView?.register(TimeCell.self, forCellWithReuseIdentifier: timeCellID)
        collectionView?.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
        NotificationCenter.default.addObserver(self, selector: #selector(self.changePartySize(_:)), name: NSNotification.Name.pickerNotification, object: nil)
        setUpViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.pickerNotification, object: nil)
    }
    
    //MARK: - Set Up UI
    func setUpViews() {
        
        view.addSubview(partyPickerView)
        partyPickerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        partyPickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        partyPickerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        partyPickerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        view.addSubview(reservationButton)
        reservationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        reservationButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        reservationButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        reservationButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}

@available(iOS 10.0, *)
extension ScheduleVC {
    
    //MARK: - CoreData
    func constructAndSaveInCoreData() {
        
        let context = CoreDataStack.sharedInstance.context
        let reservation = NSEntityDescription.insertNewObject(forEntityName: "Reservation", into: context) as? Reservation
        reservation?.day = numberDayString
        reservation?.month = monthString
        reservation?.partySize = partySize
        reservation?.serviceName = service?.name
        reservation?.servicePeriod = service?.period
        reservation?.serviceDescription = service?.typeDescription
        reservation?.time = hourString
        reservation?.weekDay = weekDayString
        reservation?.year = yearString
        
        do {
            try context.save()
        } catch let err {
            print("ERROR SAVING: ", err)
        }
    }
    
}

    //MARK: - ScheduleVC DataSource
extension ScheduleVC {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: calendarCellID, for: indexPath) as! CalendarCell
            cell.delegate = self
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: timeCellID, for: indexPath) as! TimeCell
        cell.timedelegate = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let scheduleHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! ScheduleHeaderCell
        scheduleHeaderView.delegate = self
        if let service = self.service {
            scheduleHeaderView.setUpHeaderWith(service: service)
        }
        return scheduleHeaderView
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

    //MARK: - ScheduleHeaderCellDelegate methods
extension ScheduleVC: ScheduleHeaderCellDelegate {
    func showPartySizePicker() {
        partyPickerView.alpha = 1
    }
}

extension ScheduleVC {
    //MARK: - NSnotificationupdates Party Size
    func changePartySize(_ notification: NSNotification) {
        if let partyString = notification.object as? String {
            partySize = partyString
        }
    }
}

    //MARK: - CalendarCellDelegate methods
extension ScheduleVC: CalendarCellDelegate {
    func dateSelectedWith(_ dateNumber: String, dateDay: String) {
        print("the day \(dateNumber) \(dateDay)")
        weekDayString = dateDay.convertInFullDayString()
        numberDayString = dateNumber
    }
}

    //MARK: - TimeCellDelegate methods
extension ScheduleVC: TimeCellDelegate {
    
    func timeSelectedIs(_ time: String) {
        print("\(time)")
        hourString = time
    }
}














