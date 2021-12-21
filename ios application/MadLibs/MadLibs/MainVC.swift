//
//  ViewController.swift
//  MadLibs
//
//  Created by admin on 16/12/2021.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var statmentLB: UILabel!
    var statment = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        statmentLB.text! = statment
    }
    
    func reload () {
        viewDidLoad()

    }
}

