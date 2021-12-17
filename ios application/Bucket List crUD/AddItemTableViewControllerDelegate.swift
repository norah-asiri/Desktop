//
//  AddItemTableViewControllerDelegate.swift
//  Bucket List crUD
//
//  Created by admin on 17/12/2021.
//

import Foundation
protocol AddItemTableViewControllerDelegate {
    
    func itemSave(by controller : AddItemTableTableViewController , with text : String)
    func cancelBtn(by controller : AddItemTableTableViewController)
    
}
