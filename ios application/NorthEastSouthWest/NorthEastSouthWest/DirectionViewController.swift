//
//  DirectionViewController.swift
//  NorthEastSouthWest
//
//  Created by admin on 16/12/2021.
//

import UIKit

class DirectionViewController: UIViewController {
    var output : String?
    
    @IBOutlet weak var directionBtnOutlet: UIButton!
    
    @IBAction func directionBtn(_ sender: UIButton) {
       dismiss(animated: true, completion: nil)
    }
    var direction : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        directionBtnOutlet.setTitle(output, for: .normal)
        // Do any additional setup after loading the view.
        // directionBtnOutlet.setTitle(direction, for: .normal)
    }
    
    
    


}
