//
//  CustomPageVC.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class DiscountPageController: UIPageViewController {
    
    // MARK: - Global Private constants and Variables.
    private let pageDataSource = PageControllerDataSource()
    
    // MARK: - UI Components
    lazy var serviceSelectorView: ServiceSelectorView = {
        let view = ServiceSelectorView()
        view.delegate = self
        return view
    }()

    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        setUpSubviews()
        self.dataSource = pageDataSource
        if let startVC = pageDataSource.pageViewController(atIndex: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: - Set up SubViews
    private func setUpSubviews() {

        view.addSubview(serviceSelectorView)
        serviceSelectorView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        serviceSelectorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        serviceSelectorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        serviceSelectorView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        
    }
}

extension DiscountPageController: ServiceSelectorViewDelegate {
    
    func goToSchedule(service: Service) {
        
        let scheduleVC = ScheduleVC(collectionViewLayout: UICollectionViewFlowLayout())
        scheduleVC.service = service
        navigationController?.pushViewController(scheduleVC, animated: true)
        
    }
}








