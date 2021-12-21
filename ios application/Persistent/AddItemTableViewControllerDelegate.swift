//
//  AddItemTableViewControllerDelegate.swift
//  Bucket List crUD
//
//  Created by admin on 17/12/2021.
//

import Foundation
protocol AddItemTableViewControllerDelegate {
    
    func itemSave(by controller : AddItemTableViewController , with text : String , at indexPath : NSIndexPath?)
    func cancelBtn(by controller : AddItemTableViewController)
    
}
