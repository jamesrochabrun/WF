//
//  MassageSelectorView.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Protocol for navigation purposes
protocol ServiceSelectorViewDelegate: class {
    func goToSchedule(service: Service)
}

class ServiceSelectorView: BaseView {
    
    //MARK: - private constants
    fileprivate let cellID = "cellID"
    fileprivate let serviceDataSource = ServiceDataSource()
    
    //MARK: - delegate
    weak var delegate: ServiceSelectorViewDelegate?
    
    //MARK: - UI Components
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.dataSource = self.serviceDataSource
        tv.delegate = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.alwaysBounceVertical = false
        tv.separatorStyle = .none
        return tv
    }()
    
    //MARK: - UI Set Up of  ServiceSelectorView
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

//MARK: - Delegate methods of tableView
extension ServiceSelectorView: UITableViewDelegate {
    
    //open just the HOT stone massage
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let service = serviceDataSource.getServices()[indexPath.row]
        delegate?.goToSchedule(service:service)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / CGFloat(serviceDataSource.getServices().count)
    }
}









