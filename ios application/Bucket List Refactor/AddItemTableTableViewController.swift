

import UIKit

class AddItemTableTableViewController: UITableViewController {
    
    var item : String?
    var indexPath : NSIndexPath?
    
    var delegate : AddItemTableViewControllerDelegate?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func SaveBtnPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        delegate?.itemSave(by: self , with: text , at : indexPath )
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
        
        itemTextField.text = item

    }

}
