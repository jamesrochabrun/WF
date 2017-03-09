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

    //MARK: - UI Components
    let partyPickerView: ViewPartyPicker = {
        let vpv = ViewPartyPicker()
        vpv.alpha = 0
        return vpv
    }()
    
    lazy var reservationButton: UIButton = {
        let b = UIButton()
        if #available(iOS 10.0, *) {
            b.with(title: "RESERVE", target: self, selector: #selector(constructAndSaveInCoreData), cornerRadius: 0, font: Constants.Font.medium, fontSize: 16, color: Constants.Color.doActionColor, titleColor: Constants.Color.dotWhite)
            b.alpha = 0.7
            b.isUserInteractionEnabled = false
        } else {
            // Fallback on earlier versions
        }
        return b
    }()

    //MARK: - APP Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.GeneralSrings.scheduleVCTitle
        collectionView?.backgroundColor = .white
        collectionView?.register(ScheduleHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerID)
        collectionView?.register(CalendarCell.self, forCellWithReuseIdentifier: calendarCellID)
        collectionView?.register(TimeCell.self, forCellWithReuseIdentifier: timeCellID)
        collectionView?.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
        NotificationCenter.default.addObserver(self, selector: #selector(self.changePartySize(_:)),
                                               name: NSNotification.Name.pickerNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeButtonInteraction(_:)),
                                               name: NSNotification.Name.buttonEnabledNotification,
                                               object: nil)
        setUpViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.pickerNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.buttonEnabledNotification, object: nil)
    }
    
    //MARK: - Set Up UI
    func setUpViews() {
        
        view.addSubview(reservationButton)
        reservationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        reservationButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        reservationButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        reservationButton.heightAnchor.constraint(equalToConstant: Constants.UI.footerHeight).isActive = true
        
        view.addSubview(partyPickerView)
        partyPickerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        partyPickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        partyPickerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        partyPickerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    //MARK: - Handle reservation Button
    func changeButtonInteraction(_ notification: NSNotification) {
        
        if let hour = notification.object as? String {
            hourString = hour
        }
        if let dict = notification.object as? [String: String] {
            let day = dict["day"]
            weekDayString = day?.convertInFullDayString()
            numberDayString = dict["numberDate"]
        }
        
        if hourString != nil &&
        weekDayString != nil &&
            numberDayString != nil {
            reservationButton.alpha = 1
            reservationButton.isUserInteractionEnabled = true
        }
    }
}

@available(iOS 10.0, *)
extension ScheduleVC {
    
    //MARK: - CoreData
    func constructAndSaveInCoreData() {
        
        let context = CoreDataStack.sharedInstance.context
        if let reservation = NSEntityDescription.insertNewObject(forEntityName: "Reservation", into: context) as? Reservation {
        reservation.day = numberDayString
        reservation.month = monthString
        reservation.partySize = partySize ?? "1"
        reservation.serviceName = service?.name
        reservation.servicePeriod = service?.period
        reservation.serviceDescription = service?.typeDescription
        reservation.time = hourString
        reservation.weekDay = weekDayString
        reservation.year = yearString
        }
        
        do {
            try context.save()
        } catch let err {
            print("ERROR SAVING: ", err)
        }
        DispatchQueue.main.async {
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

    //MARK: - ScheduleVC DataSource
extension ScheduleVC {
    
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













