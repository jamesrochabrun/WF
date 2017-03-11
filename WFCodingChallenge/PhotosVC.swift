//
//  File.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class PhotosVC: UICollectionViewController {
    
    //Private constants and data
    private let cellID = "cellID"
    private let photoDataSource = PhotoDataSource()
    
    //MARK: - UI Components
    let customIndicator: CustomActivityIndicator = {
        let indicator = CustomActivityIndicator()
        return indicator
    }()

    //MARK: Life cycle app
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.GeneralSrings.photosVCTitle
        collectionView?.register(PhotoCell.self, forCellWithReuseIdentifier: cellID)
        collectionView?.dataSource = photoDataSource
        collectionView?.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
        collectionView?.isPagingEnabled = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(dismissView))
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTable), name: NSNotification.Name.dataNotification, object: nil)
        setUpViews()
    }
    
    //MARK: SetUp Layout
    func setUpViews() {
        
        view.addSubview(customIndicator)
        customIndicator.heightAnchor.constraint(equalToConstant: 80).isActive = true
        customIndicator.widthAnchor.constraint(equalToConstant: 80).isActive = true
        customIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: Handle reload of table after data comes from the server
    func reloadTable() {
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
            self.customIndicator.stopAnimating()
        }
    }
    
    //MARK: Navigation
    func dismissView() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: Pagination Layout
extension PhotosVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
}


























