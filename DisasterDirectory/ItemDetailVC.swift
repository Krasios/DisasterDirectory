//
//  ItemDetailVC.swift
//  DisasterDirectory
//
//  Created by Sreelakshmi Kariyadan on 1/13/18.
//  Copyright © 2018 fireCampers. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController {
    var item : ClaimsItem?
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if (item != nil){
            image.contentMode = .scaleAspectFit
            let session = URLSession(configuration: URLSessionConfiguration.default)
            
            let request = URLRequest(url: URL(string: (item?.img)!)!)
            
            let task: URLSessionDataTask = session.dataTask(with: request) { (receivedData, response, error) -> Void in
                
                if let imgdata = receivedData {
                    let url_image = UIImage(data: imgdata)
                    DispatchQueue.main.async {
                        self.image.image = url_image
                    }
                }
            }
            task.resume()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
