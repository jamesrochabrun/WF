//
//  ReservationCell.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ReserVationCell: BaseTableViewCell {
    
    let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.hexStringToUIColor(Constants.Color.dotGray).cgColor
        v.layer.borderWidth = 0.5
        v.clipsToBounds = true
        return v
    }()
    
    let dateLabel: UILabel = {
        let l  = UILabel()
        l.with(text: "", font: Constants.Font.regular, fontSize: 20, textColor: Constants.Color.dotWhite)
        return l
    }()
    
    let hourLabel: UILabel = {
        let l  = UILabel()
        l.with(text: "", font: Constants.Font.regular, fontSize: 17, textColor: Constants.Color.dotWhite)
        l.textAlignment = .right
        return l
    }()
    
    let topView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.doActionColor)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let serviceNameLabel: UILabel = {
        let l = UILabel()
        l.with(text: "", font: Constants.Font.thin, fontSize: 23, textColor: Constants.Color.textcolorDark1)
        return l
    }()
    
    let partyLabel: UILabel = {
        let l = UILabel()
        l.with(text: "PARTY SIZE", font: Constants.Font.regular, fontSize: 15, textColor: Constants.Color.textColorGray2)
        return l
    }()
    
    let periodLabel: UILabel = {
        let l = UILabel()
        l.with(text: "", font: Constants.Font.regular, fontSize: 15, textColor: Constants.Color.textColorGray2)
        l.textAlignment = .right
        return l
    }()
    
    let dividerLine: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.dotGray)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let descriptionLabel: UILabel = {
        let l = UILabel()
        l.with(text: "", font: Constants.Font.thin, fontSize: 13, textColor: Constants.Color.textColorGray)
        return l
    }()
    
    lazy var rescheduleButton: UIButton = {
        let b = UIButton()
        b.with(title: "RESCHEDULE", target: self, selector: #selector(reschedule), cornerRadius: 4.0, font: Constants.Font.medium, fontSize: 14, color: Constants.Color.doActionColor, titleColor: Constants.Color.dotWhite)
        return b
    }()
    
    lazy var cancelButton: UIButton = {
        let b = UIButton()
        b.with(title: "CANCEL", target: self, selector: #selector(cancelReserve), cornerRadius: 4.0, font: Constants.Font.medium, fontSize: 14, color: Constants.Color.textColorGray2, titleColor: Constants.Color.dotWhite)
        return b
    }()
    
    
    override func setupViews() {
        
        backgroundColor = .clear
        addSubview(containerView)
        containerView.addSubview(topView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(hourLabel)
        containerView.addSubview(serviceNameLabel)
        containerView.addSubview(partyLabel)
        containerView.addSubview(periodLabel)
        containerView.addSubview(dividerLine)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(rescheduleButton)
        containerView.addSubview(cancelButton)
        
        containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.UI.scheduleViewPaddingBig).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        topView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.2).isActive = true
        topView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        
        dividerLine.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 8).isActive = true
        dividerLine.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        
        dateLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        hourLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        hourLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        hourLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        hourLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        partyLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        partyLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        partyLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        partyLabel.bottomAnchor.constraint(equalTo: dividerLine.topAnchor, constant: -Constants.UI.scheduleViewPaddingBig).isActive = true
        
        periodLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        periodLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        periodLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        periodLabel.bottomAnchor.constraint(equalTo: partyLabel.bottomAnchor).isActive = true
        
        serviceNameLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        serviceNameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        serviceNameLabel.bottomAnchor.constraint(equalTo: partyLabel.topAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        serviceNameLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
        
        descriptionLabel.widthAnchor.constraint(equalTo: dividerLine.widthAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: Constants.UI.scheduleViewPaddingSmall).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 33).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: dividerLine.leftAnchor).isActive = true
        
        cancelButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.42).isActive = true
        cancelButton.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.18).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: containerView.centerXAnchor, constant: Constants.UI.scheduleViewPaddingSmall).isActive = true
        cancelButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        
        rescheduleButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
        rescheduleButton.heightAnchor.constraint(equalTo: cancelButton.heightAnchor).isActive = true
        rescheduleButton.rightAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -Constants.UI.scheduleViewPaddingSmall).isActive = true
        rescheduleButton.topAnchor.constraint(equalTo: cancelButton.topAnchor).isActive = true
        
    }
    
    func setReservationCellWith(reservation: Reservation) {
        
        serviceNameLabel.text = reservation.serviceName
        periodLabel.text = reservation.servicePeriod
        if let partySize = reservation.partySize {
            partyLabel.text = "PARTY SIZE - " + partySize
        }
        descriptionLabel.text = reservation.serviceDescription
        hourLabel.text = reservation.time
        if let day = reservation.weekDay, let month = reservation.month, let dayNumber = reservation.day, let year = reservation.year {
            dateLabel.text = day + ", " + month + " " + dayNumber + ", " + year
        }
        
    }
    
    func reschedule() {
    }
    
    func cancelReserve() {
    }
    
}
