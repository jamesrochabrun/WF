//
//  MassageDataSource.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class ServiceDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Variables and constants
    
    private let cellID = "cellID"

    private var services: [Service] {
        var array = [Service]()
        let swedishMassage = Service(name: "Swedish Massage", typeDescription: "", price: 0)
        array.append(swedishMassage)
        let deepTissueMasage = Service(name: "Deep Tissue Massage", typeDescription: "", price: 0)
        array.append(deepTissueMasage)
        let hotStoneMassage = Service(name: "Hot Stone Massage", typeDescription: "Massage focused on the deepest layer of muscles to target knots and release chronic muscle tension.", price: 120.0)
        let hotStoneDiscount = Discount(mainImage: #imageLiteral(resourceName: "hotStoneDiscount"), index: 0)
        hotStoneMassage.discount = hotStoneDiscount
        array.append(hotStoneMassage)
        let reflexology = Service(name: "Reflexology", typeDescription: "", price: 0)
        array.append(reflexology)
        let triggerPoint = Service(name: "Trigger Point Therapy", typeDescription: "", price: 0)
        array.append(triggerPoint)
        return array
    }
    
    func getServices() -> [Service] {
        return services
    }
    
    // MARK: - UITableViewDataSource methods

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! ServiceSelectorCell
        let service = getServices()[indexPath.row]
        cell.setUpCellWith(service: service)
        
        switch indexPath.row {
        case 0,1,3,4:
            cell.isUserInteractionEnabled = false
        case 2:
            cell.isUserInteractionEnabled = true
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getServices().count
    }
}
