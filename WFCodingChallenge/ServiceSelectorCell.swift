//
//  MassageSelectorCell.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ServiceSelectorCell: BaseTableViewCell {
    
    let serviceLabel: UILabel = {
        let label = UILabel()
        label.with(text: "", font: Constants.Font.regular, fontSize: 15, textColor: Constants.Color.textColorDark)
        return label
    }()
    
    let dividerLine: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.dotGray)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func setupViews() {
        self.accessoryType = .disclosureIndicator
        addSubview(serviceLabel)
        serviceLabel.sizeToFit()
        serviceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        serviceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        
        addSubview(dividerLine)
        dividerLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0.5).isActive = true
        dividerLine.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    func setUpCellWith(service: Service) {
        serviceLabel.text = service.name
    }
}
