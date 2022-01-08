//
//  ViewController.swift
//  MessengerAppIOS
//
//  Created by administrator on 06/01/2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBAction func logInBtn(_ sender: UIButton) {
    
    // LOGIN  Firebase Login
        Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: { authResult, error in
       guard let result = authResult, error == nil else {
           print("Failed to log in user with email \(self.email.text!)")
           return
       }
       let user = result.user
       print("logged in user: \(user)")
   })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

