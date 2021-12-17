//
//  AddItemTableTableViewController.swift
//  Bucket List crUD
//
//  Created by admin on 17/12/2021.
//

import UIKit

class AddItemTableTableViewController: UITableViewController {
    
    var delegate : AddItemTableViewControllerDelegate?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func SaveBtnPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSave(by: self , with: text )
    }
    


    @IBAction func cancelBtnPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelBtn(by: self)
       // print("cancel")
        
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

}
