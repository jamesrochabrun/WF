//
//  MassageSelectorView.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol ServiceSelectorViewDelegate: class {
    func goToSchedule(service: Service)
}

class ServiceSelectorView: BaseView {
    
    fileprivate let cellID = "cellID"
    fileprivate let serviceDataSource = ServiceDataSource()
    weak var delegate: ServiceSelectorViewDelegate?
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.dataSource = self.serviceDataSource
        tv.delegate = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.alwaysBounceVertical = false
        return tv
    }()
    
    override func setUpViews() {
        backgroundColor = .white
        layer.cornerRadius = Constants.UI.containerCornerRadius
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ServiceSelectorCell.self, forCellReuseIdentifier: cellID)
        
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}

extension ServiceSelectorView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let service = serviceDataSource.getServices()[indexPath.row]
        print(service.name)
        switch indexPath.row {
        case 0,1,3,4:
            return
        case 2:
            delegate?.goToSchedule(service:service)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(serviceDataSource.getServices().count)
    }
}









