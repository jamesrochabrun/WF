//
//  Reservation+CoreDataProperties.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import CoreData


extension Reservation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reservation> {
        return NSFetchRequest<Reservation>(entityName: "Reservation");
    }

    @NSManaged public var month: String?
    @NSManaged public var year: String?
    @NSManaged public var day: String?
    @NSManaged public var weekDay: String?
    @NSManaged public var time: String?
    @NSManaged public var partySize: String?
    @NSManaged public var serviceName: String?
    @NSManaged public var serviceDescription: String?
    @NSManaged public var servicePeriod: String?

}
