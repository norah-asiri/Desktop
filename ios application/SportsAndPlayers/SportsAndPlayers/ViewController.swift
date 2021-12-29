//
//  ViewController.swift
//  SportsAndPlayers
//
//  Created by admin on 29/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func addAlert(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title:"New Sport" , message:"Add a new Sport", preferredStyle: .alert)
        
        alert.addTextField {(textField:UITextField) in
            textField.placeholder = "New Sport"
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action : UIAlertAction) in
            if let textField = alert.textFields?.first {
                if textField.text == "" {
                    print("You hava to enter somthing first")
                }else {
                    print("you enter \(textField.text!)")
                }
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style : .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

