//
//  ViewController.swift
//  Bucket List crUD
//
//  Created by admin on 16/12/2021.
//

import UIKit
import CoreData
import Alamofire

class BucketListViewController: UITableViewController , AddItemTableViewControllerDelegate {

    var items : [BucketList] = []
    
   // let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View Controller is loaded")
        
     // ----------------------------------------------
     // MARK: GET Request
//        BucketListAlamofire.getRequest(url : "https://saudibucketlistapi.herokuapp.com/tasks/?format=json" , rType : "get", bucketList: nil)
        
        AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json").responseDecodable(of: [BucketList].self){
            response in
            print (response)
            guard let tasks = response.value else {return}
             //   super.viewDidLoad()
            print (tasks)
            self.items = tasks
            self.tableView.reloadData()
            
        }
        
        //-------------------------------------
        
    
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].objective
        return cell
    }
    
    // ---------------------------------------------
    //MARK: Add PUT Request here
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("Select item at index \(indexPath.row)")
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EidtItemSegue", sender: indexPath)
        
    }
    
    //-----------------------------------------------
    // MARK: ADD DELETE Request here
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       // items.remove(at: indexPath.row)
        deleteCoreData(index: indexPath.row)
        
    

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
            let item = items[indexPath.row].objective
            addItemTableController.item = item
            //let update = items[indexPath.row]
            //addItemTableController.update = update
//                AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json",
//                           method: .put,
//                           parameters: add).responseDecodable(of: BucketList.self) { response in
//                    guard let response = response.value else { return }
//                    let update = response
//                    print(update) }
//
//
//           addItemTableController.indexPath = indexPath
////            addItemTableController.id =

    }
    }
 //////////////////////////////////////////
    /////>>>>>>>>>>>>>>>>>>>>>>
   func storeCoreData(item : BucketList) {
       
       //MARK: - POST Api with Alamofire - True
  //     func getMoviesWithAlamofire(){
       let add :[String : Any] = [ "id" : item.id , "objective" : item.objective , "created_at": item.created_at]
           AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json",
                      method: .post,
                      parameters: add).responseDecodable(of: BucketList.self) { response in
               guard let movieResponse = response.value else { return }
               let new = movieResponse
               print(new)
               
           }
//
//        guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
//        let manageContext = applegate.persistentContainer.viewContext
//        guard let itemEntity = NSEntityDescription.entity(forEntityName: "BucketListItem", in: manageContext) else {return}
//        let toDoObject = NSManagedObject.init(entity : itemEntity , insertInto : manageContext)
//        toDoObject.setValue(item.objective, forKey: "task")
//
//
//        do {
//            try manageContext.save()
//            print ("-------Save Done----------")
//
//        } catch {
//            print ("ERROOOOORRR")
//        }
    }//>>>>>>>>>>>>>>>>>>>>
    
    // get core data
//    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    func getCoreData(){
        
        // MARK: GET Request --> True
   //        BucketListAlamofire.getRequest(url : "https://saudibucketlistapi.herokuapp.com/tasks/?format=json" , rType : "get", bucketList: nil)
           
           AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json").responseDecodable(of: [BucketList].self){
               response in
               print (response)
               guard let tasks = response.value else {return}
                //   super.viewDidLoad()
               print (tasks)
               self.items = tasks
               self.tableView.reloadData()
               

    
//        var bucketList: [BucketList] = []
//
//        guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return[]}
//
//        let manageContext = applegate.persistentContainer.viewContext
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "BucketListItem")
//
//        do {
//            let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
//
//            for managedToDo in result {
//                let title = managedToDo.value(forKey: "task") as! String

//                let formatter = DateFormatter()
//                formatter.dateFormat = "yyyy/MM/dd HH:mm"
//                let someDateTime = formatter.date(from: "2016/10/08 22:31")!
//
//
//                let newItem = BucketList(id: 1 , objective: "Nothing", created_at: "00000")
//
//                bucketList.append(newItem)
//            }
//            try manageContext.save()
//            print ("------- update Done----------")
//
//            for i in bucketList{
//                print("\(i.objective) ")
//
//                      }
//            return bucketList
//
//        } catch {
//            print ("ERROOOOORRR")
//            return []
//        }
//    }
           }
    }
        
    //// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ///
    // update core data
    
//  //>>>>>>>>>>>>>>>>>
    func updateCoreData(item : BucketList){
        
        let del : [String : Any] = ["id": item.id , "objective": item.objective, "created_at": item.created_at]
        
            AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json",
                       method: .put ,
                       parameters: del).responseDecodable(of: BucketList.self) { response in
                guard let response = response.value else { return }
                let deleted = response
                print(deleted)
                self.tableView.reloadData()
//
//         guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
//
//         let manageContext = applegate.persistentContainer.viewContext
//
//         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "BucketListItem")
//
//         do {
//
//             let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
//
//             result[index].setValue(item.objective, forKey: "task")
//
//             try manageContext.save()
//
//             print ("-------Done update----------")
//
//
//             print("\n \(item.objective) ")
//
//         } catch {
//             print ("ERROOOOORRR")
//         }
//     }
//
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            }
    }
                
    // delete from core data

//    //>>>>>>>>>>>>>>>>>>>>>>>
   func deleteCoreData(index : Int){
       
       let del : [String : Any] = ["id": items[index].id , "objective": items[index].objective, "created_at": items[index].created_at]
       
           AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json",
                      method: .delete ,
                      parameters: del).responseDecodable(of: BucketList.self) { response in
               guard let response = response.value else { return }
               let deleted = response
               print(deleted)
               self.tableView.reloadData()
           }
//
//         guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
//
//         let manageContext = applegate.persistentContainer.viewContext
//
//         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "BucketListItem")
//
//         do {
//
//             let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
//             let toDoDelete = result[index]
//
//             manageContext.delete(toDoDelete)
//
//             try manageContext.save()
//
//             print ("-------Done delete----------")
//
//
//         } catch {
//             print ("ERROOOOORRR")
//         }
//
//        let del = ["id" : ""  ]
//            AF.request("https://saudibucketlistapi.herokuapp.com/tasks/?format=json",
//                       method: .delete,
//                       parameters: del).responseDecodable(of: BucketList.self) { response in
//                guard let movieResponse = response.value else { return }
//                let deleted = movieResponse
//                print(deleted)
//
//            }
//
//     }>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
            item.objective = text
            
            
            updateCoreData(item: item)
            
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
//            let formatter = DateFormatter()
//            formatter.dateFormat = "yyyy/MM/dd HH:mm"
//            let someDateTime = formatter.date(from: "2016/10/08 22:31")!
            
//            let t = BucketList (id: 0, objective: "St", created_at: "00000")
//           // items.append(t)
//            storeCoreData(item: t)
//
        }
        getCoreData()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
}



