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
    fileprivate var itemSelected = "1"
    
    //MARK: UI Components
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
    
    let toolsView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.layer.borderColor = UIColor.hexStringToUIColor(Constants.Color.dotGray).cgColor
        v.layer.borderWidth = 0.7
        v.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
        return v
    }()
    
    lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.with(title: "Cancel", target: self, selector: #selector(hidePicker), cornerRadius: 0, font: Constants.Font.regular, fontSize: 16, color: Constants.Color.backColor, titleColor: Constants.Color.textColorGray)
        return cancelButton
    }()
    
    lazy var doneButton: UIButton = {
        let doneButton = UIButton()
        doneButton.with(title: "Done", target: self, selector: #selector(hidepickerWithData), cornerRadius: 0, font: Constants.Font.regular, fontSize: 16, color: Constants.Color.backColor, titleColor: Constants.Color.doActionColor)
        return doneButton
    }()
    
    @objc private func hideSelf() {
        alpha = 0
    }
    
    //MARK: steUp UI Components
    override func setUpViews() {
        
        translatesAutoresizingMaskIntoConstraints = false
        pickerView.dataSource = partyPickerDatasource
        
        addSubview(toolsView)
        toolsView.heightAnchor.constraint(equalToConstant: Constants.UI.pickerBarHeight).isActive = true
        toolsView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        toolsView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        toolsView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        addSubview(pickerView)
        pickerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pickerView.topAnchor.constraint(equalTo: toolsView.bottomAnchor).isActive = true
        pickerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: Constants.UI.pickerHeight).isActive = true
        
        toolsView.addSubview(cancelButton)
        toolsView.addSubview(doneButton)
        
        cancelButton.heightAnchor.constraint(equalTo: toolsView.heightAnchor).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: toolsView.leftAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cancelButton.topAnchor.constraint(equalTo: toolsView.topAnchor).isActive = true
        
        doneButton.heightAnchor.constraint(equalTo: toolsView.heightAnchor).isActive = true
        doneButton.rightAnchor.constraint(equalTo: toolsView.rightAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        doneButton.topAnchor.constraint(equalTo: toolsView.topAnchor).isActive = true
        
    }
    
    func hidePicker() {
        NotificationCenter.default.post(name: Notification.Name.pickerNotification, object: "1")
    }
    
    func hidepickerWithData() {
        NotificationCenter.default.post(name: Notification.Name.pickerNotification, object: itemSelected)
        
    }
}

//MARK: UIPickerViewDelegate methods
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
        itemSelected = partySizeDataSource[row]
    }
    
}


















