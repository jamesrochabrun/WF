//
//  Constants.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct UI {
        
    //MARK: general Layout
        static let statusBarHeight: CGFloat = 20
        static let navigationControllerHeight: CGFloat = 44
        static let actionButtonHeight: CGFloat = 44.0
        static let actionButtonWidth: CGFloat = 175.0
        static let actionButtonFontSize: CGFloat = 17.5
        static let actionButtonCornerRadius: CGFloat = 4.0
        static let containerCornerRadius: CGFloat = 10.0
        static let pageControlHeight: CGFloat = 34.0
        static let pageControlWidth: CGFloat = 34.0
        static let selectorViewHeight: CGFloat = 250.0
        static let bottomPadding: CGFloat = 20.0
        static let pickerHeight: CGFloat = 200
        static let pickerBarHeight: CGFloat = 44
        
   //MARK: Cells layout
        static let scheduleHeaderHeight = (UIScreen.main.bounds.height - 64) * 0.35
        static let calendarCellHeight = (UIScreen.main.bounds.height - 64) * 0.22
        static let timeCellHeight = (UIScreen.main.bounds.height - 64) * 0.31
        static let footerHeight = (UIScreen.main.bounds.height - 64) * 0.1
        static let scheduleViewPadding: CGFloat = 10.0
        static let scheduleViewPaddingSmall: CGFloat = 5.0
        static let scheduleViewPaddingBig: CGFloat = 15.0
        static let calendarLabelHeight: CGFloat = 15
        static let calendarLabelWidth: CGFloat = 120
        static let timeCellWidth: CGFloat = 100.0
        static let reservatioCellHeight: CGFloat = (UIScreen.main.bounds.height - 64) * 0.43
    }
    
    struct  Font {
        static let medium = "HelveticaNeue-Medium"
        static let regular = "HelveticaNeue"
        static let thin = "HelveticaNeue-Thin"
        static let light = "HelveticaNeue-Light"
    }

    struct Color {
        static let lightBlue = "#61b3eb"
        static let dotGray = "d0d7e0"
        static let dotWhite = "ffffff"
        static let doActionColor = "026BC5"
        static let textColorDark = "08102b"
        static let textcolorDark1 = "#44464A"
        static let textColorGray = "#7d7d7d"
        static let textColorGray1 = "#53585f"
        static let textColorGray2 = "#515E66"
        static let white = "#ffffff"
        static let backColor = "#f5f5f5"
    }
    
    struct GeneralSrings {
        static let reservationVCTitle = "MY RESERVATIONS"
        static let scheduleVCTitle = "SCHEDULE"
        static let discoutnVCTitle = "SPA SERVICE"
        static let photosVCTitle = "OUR PHOTOS"
    }
    
}
