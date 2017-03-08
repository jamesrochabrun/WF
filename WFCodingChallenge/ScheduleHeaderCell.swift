//
//  InformationHeaderCell.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ScheduleHeaderCell: BaseCollectionViewCell {
    
    //MARK: - UI Components
    let scheduleInfoView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.borderColor = UIColor.hexStringToUIColor(Constants.Color.dotGray).cgColor
        v.layer.borderWidth = 0.5
        v.clipsToBounds = true
        return v
    }()
    
    let serviceImageview: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    let serviceLabel: UILabel = {
        let label = UILabel()
        label.with(text: "", font: Constants.Font.thin, fontSize: 23.5, textColor: Constants.Color.textcolorDark1)
        return label
    }()
    
    let dividerLine: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.dotGray)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.with(text: "", font: Constants.Font.regular, fontSize: 13, textColor: Constants.Color.doActionColor)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.with(text: "", font: Constants.Font.medium, fontSize: 13, textColor: Constants.Color.textcolorDark1)
        label.textAlignment = .right
        return label
    }()
    
    let typeDescriptionLabel: UILabel = {
        let tv = UILabel()
        tv.with(text: "", font: Constants.Font.light, fontSize: 12, textColor: Constants.Color.textColorGray)
        return tv
    }()
    
    let partyLabel: UILabel = {
        let label = UILabel()
        label.with(text: "", font: Constants.Font.regular, fontSize: 11, textColor: Constants.Color.textColorGray)
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    lazy var partybutton: UIButton = {
        let button = UIButton()
        button.with(title: "1", target: self, selector: #selector(test), cornerRadius: 2.5, font: Constants.Font.light, fontSize: 12, color: Constants.Color.white, titleColor: Constants.Color.textcolorDark1)
        button.layer.borderColor = UIColor.hexStringToUIColor(Constants.Color.textcolorDark1).cgColor
        button.layer.borderWidth = 0.5
        return button
    }()

    //MARK: - UI SetUP
    override func setupViews() {
        
        addSubview(scheduleInfoView)
        scheduleInfoView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        scheduleInfoView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.UI.scheduleViewPadding).isActive = true
        scheduleInfoView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        scheduleInfoView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scheduleInfoView.addSubview(serviceImageview)
        serviceImageview.heightAnchor.constraint(equalTo: scheduleInfoView.heightAnchor).isActive = true
        serviceImageview.widthAnchor.constraint(equalTo: scheduleInfoView.widthAnchor, multiplier: 0.35).isActive = true
        serviceImageview.leftAnchor.constraint(equalTo: scheduleInfoView.leftAnchor).isActive = true
        serviceImageview.topAnchor.constraint(equalTo: scheduleInfoView.topAnchor).isActive = true
        
        scheduleInfoView.addSubview(serviceLabel)
        serviceLabel.widthAnchor.constraint(equalTo: scheduleInfoView.widthAnchor, multiplier: 0.3).isActive = true
        serviceLabel.leftAnchor.constraint(equalTo: serviceImageview.rightAnchor, constant: Constants.UI.scheduleViewPadding * 2).isActive = true
        serviceLabel.heightAnchor.constraint(equalTo: scheduleInfoView.heightAnchor, multiplier: 0.3).isActive = true
        serviceLabel.topAnchor.constraint(equalTo: scheduleInfoView.topAnchor, constant: Constants.UI.scheduleViewPaddingSmall).isActive = true
        
        scheduleInfoView.addSubview(dividerLine)
        dividerLine.leftAnchor.constraint(equalTo: serviceLabel.leftAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: scheduleInfoView.rightAnchor, constant: -Constants.UI.scheduleViewPadding * 2).isActive = true
        dividerLine.topAnchor.constraint(equalTo: serviceLabel.bottomAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        
        scheduleInfoView.addSubview(timeLabel)
        timeLabel.heightAnchor.constraint(equalTo: scheduleInfoView.heightAnchor, multiplier: 0.1).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: dividerLine.leftAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: dividerLine.bottomAnchor, constant: Constants.UI.scheduleViewPaddingSmall).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        scheduleInfoView.addSubview(priceLabel)
        priceLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: timeLabel.heightAnchor).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: dividerLine.rightAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: timeLabel.topAnchor).isActive = true
        
        scheduleInfoView.addSubview(typeDescriptionLabel)
        typeDescriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: Constants.UI.scheduleViewPaddingSmall).isActive = true
        typeDescriptionLabel.widthAnchor.constraint(equalTo: dividerLine.widthAnchor).isActive = true
        typeDescriptionLabel.heightAnchor.constraint(equalTo: scheduleInfoView.heightAnchor, multiplier: 0.18).isActive = true
        typeDescriptionLabel.leftAnchor.constraint(equalTo: dividerLine.leftAnchor).isActive = true
        
        scheduleInfoView.addSubview(partyLabel)
        partyLabel.topAnchor.constraint(equalTo: typeDescriptionLabel.bottomAnchor, constant: Constants.UI.scheduleViewPadding + Constants.UI.scheduleViewPaddingSmall).isActive = true
        partyLabel.leftAnchor.constraint(equalTo: dividerLine.leftAnchor).isActive = true
        partyLabel.heightAnchor.constraint(equalTo: timeLabel.heightAnchor).isActive = true
        partyLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        scheduleInfoView.addSubview(partybutton)
        partybutton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        partybutton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        partybutton.leftAnchor.constraint(equalTo: partyLabel.rightAnchor, constant: Constants.UI.scheduleViewPadding).isActive = true
        partybutton.centerYAnchor.constraint(equalTo: partyLabel.centerYAnchor).isActive = true
    }
    
    //MARK: - SetUpCell Data
    func setUpHeaderWith(service: Service) {
        
        serviceImageview.image = service.discount?.mainImage
        serviceLabel.text = service.name
        timeLabel.text = "1H"
        priceLabel.text = "$120.00"
        typeDescriptionLabel.text = service.typeDescription
        partyLabel.text = "PARTY SIZE"
    }
    
    func test() {
        print("tap tap")
    }
    
}




