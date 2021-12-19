
//

import Foundation
protocol AddItemTableViewControllerDelegate {
    
    func itemSave(by controller : AddItemTableTableViewController , with text : String , at indexPath : NSIndexPath?)
    func cancelBtn(by controller : AddItemTableTableViewController)
    
}
