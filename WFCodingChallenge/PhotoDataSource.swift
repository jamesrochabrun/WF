//
//  PhotoDataSource.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK: - Constants and Var
    private let cellID = "cellID"
    private var photos = [Photo]()
    
    //MARK: - designated Initilizer
    override init() {
        super.init()
        
        let service = ServiceAPI()
        service.getDataWith { (result) in
            switch result {
            case .Success(let data):
                print(data)
                let photos = data.map{self.createPhotoFrom(dictionary: $0)}
                for photo in photos {
                    if let p = photo {
                        self.photos.append(p)
                    }
                }
                NotificationCenter.default.post(name: Notification.Name.dataNotification, object: nil)
            case .Error(let message):
                print("\(message)")
            }
        }
    }
    
    //MARK: Helper method for parsing data in to a Photo object
    func createPhotoFrom(dictionary: [String: AnyObject]) -> Photo? {
        
        if let mediaDictionary = dictionary["media"] as? [String: AnyObject],
            let mediaURL = mediaDictionary["m"] as? String {
            let photo = Photo(imageURL: mediaURL)
            return photo
        }
        return nil
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PhotoCell
        let photo = photos[indexPath.item]
        cell.setPhotoCellWith(photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
}

