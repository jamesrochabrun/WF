//
//  Extensions.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit


//MARK: - UIColor extensions

extension UIColor {
    
    //extension accepts a HEX string and returns the associated UIColor
    static func hexStringToUIColor(_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

//MARK: - UIButton extensions

extension UIButton {
    
    func with(title: String ,target:Any, selector:(Selector), cornerRadius: CGFloat, font: String, fontSize: CGFloat, color: String, titleColor: String) {
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(UIColor.hexStringToUIColor(titleColor), for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = UIFont(name: font, size: fontSize)
        self.addTarget(target, action: selector, for: .touchUpInside)
        self.backgroundColor = UIColor.hexStringToUIColor(color)
        self.layer.masksToBounds = true
    }
}

//MARK: - UILabel extensions

extension UILabel {
    
    func with(text: String, font: String, fontSize: CGFloat, textColor: String) {
        
        self.font = UIFont(name: font, size: fontSize)
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.hexStringToUIColor(textColor)
        self.adjustsFontSizeToFitWidth = true
    }
}

//MARK: - UItextView extensions

extension UITextView {
    
    func with(text: String, font: String, fontSize: CGFloat, textColor: String) {
        self.font = UIFont(name: font, size: fontSize)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = UIColor.hexStringToUIColor(textColor)
        self.isUserInteractionEnabled = false
        self.contentInset = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 0)
        
    }
    
    
}






















