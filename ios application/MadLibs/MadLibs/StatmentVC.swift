//
//  StstmentVC.swift
//  MadLibs
//
//  Created by admin on 16/12/2021.
//

import UIKit

class StatmentVC: UIViewController {

    @IBOutlet weak var adjTF: UITextField!
    @IBOutlet weak var nounTF: UITextField!
    @IBOutlet weak var verb2TF: UITextField!
    @IBOutlet weak var verb1TF: UITextField!
    
    
    @IBAction func submitBtn(_ sender: UIButton) {
        let statment = "We are having a perfectly \(adjTF.text!) right now. Later we will \(verb1TF.text!) and \(verb2TF.text!) in the \(nounTF.text!)"
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainVC
        
        if let view = vc {
            view.statment = statment
            present(view, animated: true , completion: nil)
            //view.reload()
            print("\(view.statment)")
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
