//
//  ViewController.swift
//  WFCodingChallenge
//
//  Created by James Rochabrun on 3/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 10.0, *)
class ReservationsVC: UITableViewController, ReservationCellDelegate {
    
    //MARK: - private constants
    private let cellID = "cellID"
    
    // MARK: - FetchResultController
    lazy var fetchedhResultController: NSFetchedResultsController<NSFetchRequestResult> = {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Reservation.self))
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "day", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.sharedInstance.context, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.GeneralSrings.reservationVCTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: .plain, target: self, action: #selector(showSpaServiceVC))
        tableView?.backgroundColor = UIColor.hexStringToUIColor(Constants.Color.backColor)
        tableView?.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(ReserVationCell.self, forCellReuseIdentifier: cellID)
        do {
            try self.fetchedhResultController.performFetch()
            print("COUNT FETCH: \(self.fetchedhResultController.sections?[0].numberOfObjects)")
        } catch let error  {
            print("ERROR: \(error)")
        }
    }
    
    //MARK: - Datasource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ReserVationCell
        if let reservation = fetchedhResultController.object(at: indexPath) as? Reservation {
            cell.setReservationCellWith(reservation: reservation)
        }
        cell.delegate = self
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = fetchedhResultController.sections?.first?.numberOfObjects {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.UI.reservatioCellHeight
    }
    
    //MARK: - Navigation    
    func showSpaServiceVC() {
        let discountPageVC = DiscountPageController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        let navVC = UINavigationController(rootViewController: discountPageVC)
        self.present(navVC, animated: true)
    }
    
    //MARK: - ReservationCellDelegate method
    func displayAlertToCancel(reservation: Reservation?) {
        
        guard let reserve = reservation else {
            print("NO RESERVATION PASSED")
            return
        }
        
        let alertController = UIAlertController(title: reserve.serviceName, message: "Are you sure that you want to delete this reservation?", preferredStyle: .alert)
        let delete = UIAlertAction(title: "DELETE" , style: .default) { (action) in
            CoreDataStack.sharedInstance.context.delete(reserve)
            CoreDataStack.sharedInstance.saveContext()
        }
        let cancel = UIAlertAction(title: "CANCEL", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(delete)
        alertController.addAction(cancel)
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

    //MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

@available(iOS 10.0, *)
extension ReservationsVC: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            self.tableView.insertRows(at: [newIndexPath!], with: .automatic)
        case .delete:
            self.tableView.deleteRows(at: [indexPath!], with: .automatic)
        default:
            break
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
}



















