//
//  ViewController.swift
//  NorthEastSouthWest
//
//  Created by admin on 12/12/2021.
//

import UIKit

class ViewController: UIViewController {

    var direction : String = ""
    

    @IBAction func setDirection(_ sender: UIButton) {
        direction = sender.titleLabel?.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DirectionViewController
       
        // send value
        destination.output = direction
    }



}

