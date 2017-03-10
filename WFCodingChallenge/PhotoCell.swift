//
//  PhotoCell.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: BaseCollectionViewCell {
    
    let photoImageview: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override func setupViews() {
        
        addSubview(photoImageview)
        photoImageview.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        photoImageview.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        photoImageview.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        photoImageview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    func setPhotoCellWith(_ photo: Photo) {
        DispatchQueue.main.async {
        self.photoImageview.loadImageUsingCacheWithURLString(photo.imageURL, placeHolder: UIImage(named: "hotStoneDiscount"))
        }
    }
}
