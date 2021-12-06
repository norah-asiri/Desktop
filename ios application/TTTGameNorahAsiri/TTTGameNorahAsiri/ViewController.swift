//
//  ViewController.swift
//  TTTGameNorahAsiri
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    var player1 : [UIButton] = []
    var player2 : [UIButton] = []

    @IBOutlet var gameButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    setupUI()
    }
    
    func setupUI(){
        for aBtn in gameButton {
            aBtn.layer.backgroundColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBAction func gameAction(_ sender: UIButton) {
        print ("My tag is \(sender.tag)")
    
    
    }
    

}

