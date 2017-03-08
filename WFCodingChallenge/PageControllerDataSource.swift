//
//  PageControllerDataSource.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PageControllerDataSource: NSObject, UIPageViewControllerDataSource {
    
    // MARK: - Private Variables
    private var discounts: [Discount] {
        var array = [Discount]()
        let mothersDayDiscount = Discount(mainImage: #imageLiteral(resourceName: "mothersDayDiscount"), index: 0)
        array.append(mothersDayDiscount)
        let hotStoneDiscount = Discount(mainImage: #imageLiteral(resourceName: "hotStoneDiscount"), index: 1)
        array.append(hotStoneDiscount)
        let deepTissueDiscount = Discount(mainImage: #imageLiteral(resourceName: "deepTissueDiscount"), index: 2)
        array.append(deepTissueDiscount)
        return array
    }
    
    // MARK: - UIPageViewControllerDataSource Protocol methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let discount = (viewController as! DiscountVC).discount {
            var index = discount.index
            index -= 1
            return self.pageViewController(atIndex: index)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let discount = (viewController as! DiscountVC).discount {
            var index = discount.index
            index += 1
            return self.pageViewController(atIndex: index)
        }
        return nil
    }
    
    //Helper method that returns an initialized VC based on the index
    func pageViewController(atIndex index: Int) -> DiscountVC? {
        
        if index == NSNotFound || index < 0 || index >= self.discounts.count {
            return nil
        }
        let discountVC = DiscountVC()
        discountVC.discount = discounts[index]
        return discountVC
    }
}
