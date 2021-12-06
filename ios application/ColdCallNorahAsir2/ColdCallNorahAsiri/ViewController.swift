//
//  ViewController.swift
//  ColdCallNorahAsiri
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var numberLable: UILabel!
    @IBAction func callBtn(_ sender: UIButton) {
        update()
    }
    
    let names : [String] = ["Cody","Jay","Jimmy","Bryant","Ryota","Uyanga","Courtney", "Norah", "Hasan", "Ali" , "Asiri"]
    var random_Number = 0
    var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func update (){
        random_Number = Int.random(in:0..<names.count)
        nameLable.text = names[random_Number]
        
        number = Int.random(in:1...5)
        numberLable.text = "\(number)"
        
        if number == 1 || number == 2 {
            numberLable.textColor = UIColor.red
        } else if  number == 3 || number == 4 {
            numberLable.textColor = UIColor.orange
        } else{
            numberLable.textColor = UIColor.green
            
        }
            
    }


}

