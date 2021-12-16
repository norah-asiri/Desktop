//
//  CustomCellBinary.swift
//  BinaryCounter
//
//  Created by admin on 16/12/2021.
//

import UIKit

protocol CustomCellBinaryDelegate : class {
    func totalValueChanged(value : Int)
}

class CustomCellBinary: UITableViewCell {

    @IBOutlet weak var powerLabel: UILabel!
    weak var delegate : CustomCellBinaryDelegate?
    
    @IBAction func addBtn(_ sender: UIButton) {
        var add = Int(powerLabel!.text!)
        add = +add!
        delegate?.totalValueChanged(value : add!)
        
    }
    
    @IBAction func subBtn(_ sender: UIButton) {
        var sub = Int(powerLabel!.text!)
        sub = -sub!
        delegate?.totalValueChanged(value : sub!)
        
    }
}
    
  
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }


