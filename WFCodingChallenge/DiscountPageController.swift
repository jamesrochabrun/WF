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
    
    // MARK: - UI
    lazy var serviceSelectorView: ServiceSelectorView = {
        let view = ServiceSelectorView()
        view.delegate = self
        return view
    }()

    //MARK: - App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.GeneralSrings.discoutnVCTitle
        self.dataSource = pageDataSource
        view.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
        automaticallyAdjustsScrollViewInsets = false
        setUpSubviews()
        if let startVC = pageDataSource.pageViewController(atIndex: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissView))
    }
    
    //MARK: - Set up SubViews
    private func setUpSubviews() {

        view.addSubview(serviceSelectorView)
        serviceSelectorView.heightAnchor.constraint(equalToConstant: Constants.UI.selectorViewHeight).isActive = true
        serviceSelectorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.UI.bottomPadding).isActive = true
        serviceSelectorView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.UI.scheduleViewPaddingBig).isActive = true
        serviceSelectorView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.UI.scheduleViewPaddingBig).isActive = true
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

    //MARK: ServiceSelectorViewDelegate methods
extension DiscountPageController: ServiceSelectorViewDelegate {
    
    func goToSchedule(service: Service) {
        
        let scheduleVC = ScheduleVC(collectionViewLayout: UICollectionViewFlowLayout())
        scheduleVC.service = service
        navigationController?.pushViewController(scheduleVC, animated: true)
        
    }
}








