//
//  ViewController.swift
//  ColdCallNorahAsiri
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLable: UILabel!
    
    @IBAction func callBtn(_ sender: UIButton) {
        update()
    }
    let names : [String] = ["Cody","Jay","Jimmy","Bryant","Ryota","Uyanga","Courtney", "Norah", "Hasan", "Ali" , "Asiri"]
    var random_Number = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func update (){
        random_Number = Int.random(in:0..<names.count)
        nameLable.text = names[random_Number]
    }


}

