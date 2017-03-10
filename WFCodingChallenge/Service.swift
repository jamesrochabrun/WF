//
//  Massage.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

//Main class
class Service: NSObject {
    
    let name: String
    let typeDescription: String
    let price: CGFloat
    var discount: Discount?
    let period: String = "1H"
    
    init(name: String, typeDescription: String, price: CGFloat) {
        self.name = name
        self.typeDescription = typeDescription
        self.price = price
    }
}

struct Discount {
    
    var mainImage: UIImage?
    var index: Int = 0
    
    init(mainImage: UIImage, index: Int) {
        self.mainImage = mainImage
        self.index = index
    }
}


struct ReservationState {
    var weekDay: String?
    var dayNumber: String?
    var hour: String?
}
