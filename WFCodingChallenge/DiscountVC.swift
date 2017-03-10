//
//  discountVC.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class DiscountVC: UIViewController {
    
    //MARK: - Global variables and constants
    var discount: Discount? {
        didSet {
            if let discountImage = discount?.mainImage {
                self.imageView.image = discountImage
            }
            if let index = discount?.index {
                self.pageControl.currentPage = index
            }
        }
    }
    
    //MARK: - UI Components
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.numberOfPages = 3
        pc.pageIndicatorTintColor = UIColor.hexStringToUIColor(Constants.Color.dotGray)
        pc.currentPageIndicatorTintColor = UIColor.hexStringToUIColor(Constants.Color.dotWhite)
        return pc
    }()
    
    lazy var reserveButton: UIButton = {
        let button = UIButton()
        button.with(title: "RESERVE", target: self, selector: #selector(goToSchedule), cornerRadius: Constants.UI.actionButtonCornerRadius, font: Constants.Font.medium, fontSize: Constants.UI.actionButtonFontSize, color: Constants.Color.doActionColor, titleColor: Constants.Color.white)
        return button
    }()
  
    //MARK: - App lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUPSubViews()
    }
    
    //MARK: - set Up UI
    private func setUPSubViews() {
        
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor,
                                       constant: Constants.UI.statusBarHeight + Constants.UI.navigationControllerHeight).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        view.addSubview(pageControl)
        pageControl.widthAnchor.constraint(equalToConstant: Constants.UI.pageControlWidth).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: Constants.UI.pageControlHeight).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(Constants.UI.selectorViewHeight + Constants.UI.bottomPadding)).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  
        view.addSubview(reserveButton)
        reserveButton.widthAnchor.constraint(equalToConstant: Constants.UI.actionButtonWidth).isActive = true
        reserveButton.heightAnchor.constraint(equalToConstant: Constants.UI.actionButtonHeight).isActive = true
        reserveButton.leftAnchor.constraint(equalTo: view.leftAnchor,
                                            constant: 25).isActive = true
        reserveButton.topAnchor.constraint(equalTo: imageView.topAnchor,
                                           constant: view.frame.height/3.3).isActive = true
    }
    
    //MARK: Navigation
    func goToSchedule() {
        
        if pageControl.currentPage != 1 { return }
        let scheduleVC = ScheduleVC(collectionViewLayout: UICollectionViewFlowLayout())
        let hotStoneMassage = Service(name: "Hot Stone Massage", typeDescription: "Massage focused on the deepest layer of muscles to target knots and release chronic muscle tension.", price: 120.0)
        let hotStoneDiscount = Discount(mainImage: #imageLiteral(resourceName: "hotStoneDiscount"), index: 0)
        hotStoneMassage.discount = hotStoneDiscount
        scheduleVC.service = hotStoneMassage
        navigationController?.pushViewController(scheduleVC, animated: true)
    }
}







