//
//  BusinessHours.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation

import UIKit

class BusinessHours: NSObject {
    
    //MARK: - Private global constants
    private let calendar = NSCalendar.current
    private let components = NSDateComponents()
    private let dateFormatter = DateFormatter()
    private let closingHour = "09:00 PM"
    private var openingHour = "9:00 AM"
    private var reservationTimes: [Date] = [Date]()
    
    
    //MARK: - Helper method
    func getBusinessHours() -> [Date] {
        
        // Starting time
        components.hour = 9
        
        // Not milittary time
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        //hour time interval
        var time = calendar.date(from: components as DateComponents)!
        
        // put the hour into an array and inceremnt it by 1 HR
        while openingHour != closingHour {
            reservationTimes.append(time)
            time = calendar.date(byAdding: .hour, value: 1, to: time)!
            openingHour = dateFormatter.string(from: time)
        }
        return reservationTimes
    }
}












