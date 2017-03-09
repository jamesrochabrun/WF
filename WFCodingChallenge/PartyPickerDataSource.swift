//
//  PartyPickerDataSource.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class PartyPickerDataSource: NSObject, UIPickerViewDataSource {
    
    //MARK: - Global Private constants
    let pickerDataSource = PartySizeOptionsModel()
    
    //MARK: - Picker View Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.getOptions().count
    }
    
    
}
