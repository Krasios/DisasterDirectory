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
        let case1 = ClaimsItem(type: "Sofa",img: "https://dreamroomshouston.com/wp-content/uploads/2015/10/12000-38-SET-450x450.jpg",cost: 1000)
        let case2 = ClaimsItem(type: "Lamp",img: "https://i.pinimg.com/736x/78/f7/e3/78f7e3951451c2599283b02b4d6624c9--table-lamps-for-bedroom-bedroom-decor.jpg",cost: 15)
        let case3 = ClaimsItem(type: "Armchair",img: "https://i.pinimg.com/736x/a1/51/0d/a1510de2f06cfffceead5a80dd205c83--chesterfield-armchair-leather-chesterfield.jpg",cost: 300)
        let case4 = ClaimsItem(type: "Television",img: "http://tjihome.com/wp-content/uploads/2016/08/tv-in-living-room-Cool-HD9A12.jpg",cost: 500)
        let case5 = ClaimsItem(type: "Toaster", img: "https://i.pinimg.com/736x/b1/d6/6f/b1d66fb47379f05f3117775f2ad535dd--modern-toasters-gift-registry.jpg", cost: 50)
        let case6 = ClaimsItem(type: "Bed",img: "https://s-media-cache-ak0.pinimg.com/originals/e8/3e/8a/e83e8ad8b75a9715f3358542d39cc240.jpg",cost: 1500)
        let case7 = ClaimsItem(type: "Desk",img: "https://www.officedepot.com/resource/image/40796/portrait_ratio1x1/250/250/7d62571c58ef90f72ce963f4881e065a/kG/executive-desks--1-.jpg",cost: 300)
        let case8 = ClaimsItem(type: "Washer",img: "https://cdn.freshome.com/wp-content/uploads/2015/07/laundry-6.jpg",cost: 1000)
        let case9 = ClaimsItem(type: "Desktop",img: "http://images.dannychoo.com/cgm/images/post/20100831/25777/103938/large/9dda35d30346756e5ec027f39e999637.jpg",cost: 2700)
        let case10 = ClaimsItem(type: "Microwave",img: "https://i.pinimg.com/736x/a1/51/0d/a1510de2f06cfffceead5a80dd205c83--chesterfield-armchair-leather-chesterfield.jpg",cost: 100)
        let case11 = ClaimsItem(type: "Oven",img: "http://tjihome.com/wp-content/uploads/2016/08/tv-in-living-room-Cool-HD9A12.jpg",cost: 800)
        claimsItems+=[case1,case2,case3,case4,case5,case6,case7,case8,case9,case10,case11]
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
