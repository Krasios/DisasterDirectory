//
//  MLController.swift
//  DisasterDirectory
//
//  Created by Sreelakshmi Kariyadan on 1/12/18.
//  Copyright © 2018 fireCampers. All rights reserved.
//

import UIKit

class MLController: UIViewController, UINavigationControllerDelegate{

    @IBOutlet weak var cameraView: UIImageView!
    @IBOutlet weak var MLlabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func cameraOn(_ sender: UIBarButtonItem) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("no camera")
            return
        }
        let cameraPicker = UIImagePickerController()
        print("hello")
        cameraPicker.delegate = self
        print("hi")
        cameraPicker.sourceType = .camera
        print("yo")
        cameraPicker.allowsEditing = false
        print("get rekt")
        
        present(cameraPicker, animated: true)
        print("rip")
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
extension MLController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
