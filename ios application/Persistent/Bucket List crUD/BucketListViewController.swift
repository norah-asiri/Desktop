//
//  ViewController.swift
//  Bucket List crUD
//
//  Created by admin on 16/12/2021.
//

import UIKit
import CoreData

class BucketListViewController: UITableViewController , AddItemTableViewControllerDelegate {

    var items : [BucketList] = []
   // let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("loaded")
        items = getCoreData()
        
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].task!
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
        deleteCoreData(index: indexPath.row)
        tableView.reloadData()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItemSegue" {
        let navigationController = segue.destination as! UINavigationController
        let addItemTableController = navigationController.topViewController as! AddItemTableViewController
        addItemTableController.delegate = self
            
        } else if segue.identifier == "EidtItemSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let addItemTableController = navigationController.topViewController as! AddItemTableViewController
            addItemTableController.delegate = self
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row].task!
            addItemTableController.item = item
            addItemTableController.indexPath = indexPath
        }
    }
 ////////////////////////////////////////
    func storeCoreData(item : BucketList) {
        
        guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = applegate.persistentContainer.viewContext
        guard let itemEntity = NSEntityDescription.entity(forEntityName: "BucketListItem", in: manageContext) else {return}
        let toDoObject = NSManagedObject.init(entity : itemEntity , insertInto : manageContext)
        
        
        toDoObject.setValue(item.task, forKey: "task")
      
        
        do {
            try manageContext.save()
            print ("-------Save Done----------")
            
        } catch {
            print ("......................ERROOOOORRR \(error)")
        }
    }
    
    // get core data
    
    func getCoreData() -> [BucketList]{
        var bucketList: [BucketList] = []
        
        guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return[]}
        
        let manageContext = applegate.persistentContainer.viewContext
       
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "BucketListItem")
    
        do {
            let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for managedToDo in result {
                let title = managedToDo.value(forKey: "task") as! String
            
                
                let newItem = BucketList(task: title)
                
                bucketList.append(newItem)
            }
            try manageContext.save()
            print ("------- update Done----------")
            
            for i in bucketList{
                print("\(i.task) ")
                      
                      }
            return bucketList
            
        } catch {
            print ("ERROOOOORRR")
            return []
        }
    }

    // update core data
    
    
    func updateCoreData(item : BucketList , index : Int){
                  
         guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
         
         let manageContext = applegate.persistentContainer.viewContext
        
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "BucketListItem")
         
         do {
            
             let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
             
             result[index].setValue(item.task, forKey: "task")
             
             try manageContext.save()
             
             print ("-------Done update----------")
             
        
             print("\n \(item.task) ")
             
         } catch {
             print ("ERROOOOORRR")
         }
     }
     
    
    // delete from core data
    
    func deleteCoreData(index : Int){
                  
         guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
         
         let manageContext = applegate.persistentContainer.viewContext
        
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "BucketListItem")
         
         do {
            
             let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
             let toDoDelete = result[index]
            
             manageContext.delete(toDoDelete)
             
             try manageContext.save()
             
             print ("-------Done delete----------")
           
             
         } catch {
             print ("ERROOOOORRR")
         }
     }
     
/////////////////////////////////////////
   /*
    func fetchAllItems(){
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")

        do {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.fetch(itemRequest)
            // downcast the results as an array of AwesomeEntity objects, replace with your entity name
            // we are assuming items is an array if type AwesomeEntity defined at the top of your class
            items = results as! [BucketList]
            tableView.reloadData()
            // print the details of each item
            for item in items {
                print("\(item.task)")
                
            
                
            }
        } catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
       

    }
    */

    
    func cancelBtn(by controller: AddItemTableViewController) {
        print ("hidden , cancelBtnPressed")
        dismiss(animated: true, completion: nil)
    }
    
    func itemSave(by controller: AddItemTableViewController , with text : String, at indexPath : NSIndexPath?) {
        if let ip = indexPath {
            var item = items[ip.row]
            item.task = text
            updateCoreData(item: item, index: ip.row)
            
            /*
            if managedObjectContext.hasChanges {
                do {
                    try managedObjectContext.save()
                    print("Success")
                } catch {
                    print("\(error)")
                }
            }
            
            //let thing = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
              //  thing.task = text
            */
        } else {
        print ("text : \(text)")
          
           // let thing = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem

          //  var item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketList
          //  thing.task = text
            let t = BucketList(task : text)
           // items.append(t)
            storeCoreData(item: t)
    
        }
        items = getCoreData()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
}

