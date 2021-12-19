

import Foundation
protocol AddItemTableViewControllerDelegate {
    
    func itemSave(by controller : AddItemTableTableViewController , with text : String)
    func cancelBtn(by controller : AddItemTableTableViewController)
    
}
