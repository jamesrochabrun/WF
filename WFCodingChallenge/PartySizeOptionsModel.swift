//
//  PartySizeOptionsModel.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PartySizeOptionsModel: NSObject {
    
    //MARK: - Global Private variable
    private var pickerData: [String] = [String]()
    
    //MARK: - designated Initilizer
    override init() {
        super.init()
        setPickerData()
    }
    
    //MARK: - helper method
    private func setPickerData() {
        for x in 1...12 {
            pickerData.append(String(x))
        }
    }
    
    func getOptions() -> [String] {
        return pickerData
    }
}
