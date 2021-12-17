//
//  ViewController.swift
//  Bucket List crUD
//
//  Created by admin on 16/12/2021.
//

import UIKit

class BucketListViewController: UITableViewController , CancelBtnDelegate {

    var items = ["Go to the moon", "Eat a candy bar", "Swim in the Amazon", "Ride a motorbike in Tokyo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("loaded")
    }
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let addItemTableController = navigationController.topViewController as! AddItemTableTableViewController
        addItemTableController.delegate = self
        
    }
    func cancelBtnPerssed(by controller: UIViewController) {
        print ("hidden , cancelBtnPressed")
        dismiss(animated: true, completion: nil)
    }
    }




