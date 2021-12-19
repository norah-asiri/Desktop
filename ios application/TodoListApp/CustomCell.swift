//
//  CustomCell.swift
//  TodoListApp
//
//  Created by admin on 19/12/2021.
//

import UIKit

class CustomCell:  UITableViewCell {

 
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var checkBtnOutlet: UIButton!
    
    @IBAction func checkBtnAction(_ sender: UIButton) {
    }
}
