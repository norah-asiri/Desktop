//
//  ViewController.swift
//  Bucket List crUD
//
//  Created by admin on 16/12/2021.
//

import UIKit

class BucketListViewController: UITableViewController , AddItemTableViewControllerDelegate {

    

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("Select item at index \(indexPath.row)")
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EidtItemSegue", sender: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItemSegue" {
        let navigationController = segue.destination as! UINavigationController
        let addItemTableController = navigationController.topViewController as! AddItemTableTableViewController
        addItemTableController.delegate = self
            
        } else if segue.identifier == "EidtItemSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let addItemTableController = navigationController.topViewController as! AddItemTableTableViewController
            addItemTableController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableController.item = item
            addItemTableController.indexPath = indexPath
        }
    }
    func cancelBtn(by controller: AddItemTableTableViewController) {
        print ("hidden , cancelBtnPressed")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSave(by controller: AddItemTableTableViewController , with text : String, at indexPath : NSIndexPath?) {
        if let ip = indexPath {
            items[ip.row] = text
        } else {
        print ("text : \(text)")
        items.append(text)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        

    }
    }




