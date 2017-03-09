//
//  ViewPartyPicker.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ViewPartyPicker: BaseView {
    
    fileprivate let partySizeDataSource = PartySizeOptionsModel().getOptions()
    fileprivate let partyPickerDatasource = PartyPickerDataSource()
    
    lazy var pickerView: UIPickerView = {
        let pickerV = UIPickerView()
        pickerV.showsSelectionIndicator = true
        pickerV.translatesAutoresizingMaskIntoConstraints = false
        pickerV.backgroundColor = .white
        pickerV.tintAdjustmentMode = .automatic
        pickerV.tintColor = UIColor.hexStringToUIColor(Constants.Color.doActionColor)
        pickerV.setValue(UIColor.hexStringToUIColor(Constants.Color.doActionColor), forKey: "textColor")
        pickerV.delegate = self
        return pickerV
    }()
    
    lazy var touchView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.textcolorDark1)
        v.alpha = 0.8
        v.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSelf)))
        return v
    }()
    
    @objc private func hideSelf() {
        alpha = 0
    }
    
    override func setUpViews() {
        
        translatesAutoresizingMaskIntoConstraints = false
        pickerView.dataSource = partyPickerDatasource

        addSubview(touchView)
        touchView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        touchView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        touchView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        touchView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(pickerView)
        pickerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: pickerView.intrinsicContentSize.height).isActive = true
    }
}

extension ViewPartyPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return partySizeDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        let string = partySizeDataSource[row]
        NotificationCenter.default.post(name: Notification.Name.pickerNotification, object: string)
    }
    
}


















