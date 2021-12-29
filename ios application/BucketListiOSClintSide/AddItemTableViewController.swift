//
//  AddItemTableTableViewController.swift
//  Bucket List crUD
//
//  Created by admin on 17/12/2021.
//

import UIKit
import Alamofire


class AddItemTableViewController: UITableViewController {
    
    var item : String?
    var indexPath : NSIndexPath?
    var id : Int?
    var updateItem : BucketList?
    
    var delegate : AddItemTableViewControllerDelegate?
    
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func SaveBtnPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text!
        
       
        //MARK: - POST Api with Alamofire
   //     func getMoviesWithAlamofire(){
        if (item?.isEmpty == false){
        
            let update = ["objective" : text ]
            AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json",
                       method: .put,
                       parameters: update).responseDecodable(of: BucketList.self) { response in
                guard let movieResponse = response.value else { return }
                let updated = response
                print(updated)
                
            }
        }else {
        let add = ["objective" : text ]
            AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json",
                       method: .post,
                       parameters: add).responseDecodable(of: BucketList.self) { response in
                guard let movieResponse = response.value else { return }
                let new = movieResponse
                print(new)
                
            }
            }
        
        
        
        
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
