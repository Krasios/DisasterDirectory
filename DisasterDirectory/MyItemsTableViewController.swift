//
//  MyItemsTableViewController.swift
//  DisasterDirectory
//
//  Created by Sreelakshmi Kariyadan on 1/13/18.
//  Copyright © 2018 fireCampers. All rights reserved.
//

import UIKit

class MyItemsTableViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var claimsItems = [ClaimsItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSlideMenuButton()
        tableView.delegate = self
        tableView.dataSource = self
        self.loadData()//hardcoded data
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    //hardcode things here
    private func loadData(){
        let case1 = ClaimsItem(type: "sofa",img: "https://dreamroomshouston.com/wp-content/uploads/2015/10/12000-38-SET-450x450.jpg",cost: 1000)
        claimsItems+=[case1]
    }
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return claimsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTVC
        cell.itemLabel.text = claimsItems[indexPath.row].type

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // NAVAGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if (segue.identifier == "addFromPhotos"){
            let destinationController = segue.destination as! MLController
            destinationController.lib = true
        }else if(segue.identifier == "ShowDetail"){
            let ViewDetailController = segue.destination as! ItemDetailVC
            let selectedSection = sender as! ItemTVC
            let indexPath = tableView.indexPath(for: selectedSection)
            let selectedItem = claimsItems[(indexPath?.row)!]
            ViewDetailController.item = selectedItem
        }
    }
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ItemDetailVC, let item = sourceViewController.item {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                claimsItems[selectedIndexPath.row] = item
               tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }else{
                // Add a new meal.
                let newIndexPath = IndexPath(row: claimsItems.count, section: 0)
                
                claimsItems.append(item)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}
