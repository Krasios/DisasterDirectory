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
        let case3 = ClaimsItem(type: "Armchair",img: "https://st.hzcdn.com/simgs/fda1b2e901f12c08_4-3156/traditional-living-room.jpg",cost: 300)
        let case4 = ClaimsItem(type: "Television",img: "https://i.pinimg.com/736x/9f/e7/ae/9fe7ae8bbbf9c26118d549ae88305610--small-living-rooms-living-room-designs.jpg",cost: 500)
        let case5 = ClaimsItem(type: "Toaster", img: "https://i.pinimg.com/736x/b1/d6/6f/b1d66fb47379f05f3117775f2ad535dd--modern-toasters-gift-registry.jpg", cost: 50)
        let case6 = ClaimsItem(type: "Bed",img: "https://s-media-cache-ak0.pinimg.com/originals/e8/3e/8a/e83e8ad8b75a9715f3358542d39cc240.jpg",cost: 1500)
        let case7 = ClaimsItem(type: "Desk",img: "http://decorchick.com/wp-content/uploads/2012/08/Desk-1.png",cost: 300)
        let case8 = ClaimsItem(type: "Washer",img: "https://i.pinimg.com/736x/4d/91/d7/4d91d7f8cf803ef076dc7e97d45664de--laundry-room-sink-small-small-space-laundry-room-ideas.jpg",cost: 1000)
        let case9 = ClaimsItem(type: "Desktop",img: "http://grumpyguyinc.com/wp-content/uploads/2011/12/IMG_4981.jpg",cost: 2700)
        let case10 = ClaimsItem(type: "Microwave",img: "https://fthmb.tqn.com/GUerplIyU4PL9Lasd0tsKmz5DIQ=/960x0/filters:no_upscale()/115050166-58addedd3df78c345bdfe64a.jpg",cost: 100)
        let case11 = ClaimsItem(type: "Oven",img: "http://www.designerhomesurplus.com/blog/wp-content/uploads/2013/02/FREESTANDING_VS_SLIDEIN_1.jpg",cost: 800)
        let case12 = ClaimsItem(type: "Bookcase",img: "http://www.ikea.com/ms/media/seorange/20174/20143_lica01a_bookcases_PH137958.jpg",cost: 250)
        let case13 = ClaimsItem(type: "Table",img: "https://www.furniturecreations.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/a/s/asht580-1.jpg",cost: 400)
        let case14 = ClaimsItem(type: "Vase",img: "http://ifresh-design.com/wp-content/uploads/2017/05/greek-vase-geometric-design.jpg",cost: 1200)
        claimsItems+=[case1,case2,case3,case4,case5,case6,case7,case8,case9,case10,case11,case12,case13,case14]
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
