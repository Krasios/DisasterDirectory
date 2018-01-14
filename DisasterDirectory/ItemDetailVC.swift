//
//  ItemDetailVC.swift
//  DisasterDirectory
//
//  Created by Sreelakshmi Kariyadan on 1/13/18.
//  Copyright © 2018 fireCampers. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController, UITextFieldDelegate {
    var item : ClaimsItem?
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var typeField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        typeField.delegate  = self
        priceField.delegate = self
        image.contentMode = .scaleAspectFit
        if (item != nil){
            typeField.text = item!.type
            priceField.text = item!.cost
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y - 200, width: self.view.frame.size.width, height: self.view.frame.size.height)
        })
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y + 200, width: self.view.frame.size.width, height: self.view.frame.size.height)
        })
    }
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func editDone(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "editSave", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        let button = sender as? UIBarButtonItem
        if (button === saveBtn){
            var cost = 0
            let type = typeField.text ?? ""
            let price : Int? = Int(priceField.text!)
            if price != nil{
                cost+=price!
            }
            let link = item?.img
            item = ClaimsItem(type: type,img:link!,cost: cost)
        }
    }
 

}
