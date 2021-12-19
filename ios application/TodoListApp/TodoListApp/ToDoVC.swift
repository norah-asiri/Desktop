//
//  ViewController.swift
//  TodoListApp
//
//  Created by admin on 19/12/2021.
//

import UIKit
import CoreData

class ToDoVC: UITableViewController {

    let todeTest = ToDo(title: "test", description: "teeeeeeest", date : nil)
    let toDoUpdate = ToDo(title: "UPDATEtest", description: "teeeeeeestUuuuuuup", date: nil)
    
    
    
    
    // <#Date #>
    //date: <#20/11/2021#>
    //, date: <#20/11/2021#>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       //print("STAAAAAAART")
       //storeToDo(todo: todeTest)
       // getToDo()
       // updateToDo(todo: toDoUpdate , index: 0)
        deleteToDo(index: 0)
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
       // cell.
        cell.textLabel?.text = todeTest.title
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    
    // save to core data
    
    func storeToDo(todo : ToDo) {
        
        guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = applegate.persistentContainer.viewContext
        guard let toDoEntity = NSEntityDescription.entity(forEntityName: "ToDoEntity", in: manageContext) else {return}
        let toDoObject = NSManagedObject.init(entity : toDoEntity , insertInto : manageContext)
        toDoObject.setValue(todo.title, forKey: "title")
        toDoObject.setValue(todo.description, forKey: "descrpition")
        toDoObject.setValue(todo.date, forKey: "date")
        
        do {
            try manageContext.save()
            print ("-------Done----------")
            
        } catch {
            print ("ERROOOOORRR")
        }
    }
    
    // get core data
    
    func getToDo() -> [ToDo]{
        var toDos: [ToDo] = []
        
        guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return[]}
        
        let manageContext = applegate.persistentContainer.viewContext
       
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "ToDoEntity")
    
        do {
            let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for managedToDo in result {
                let title = managedToDo.value(forKey: "title") as! String
                
                let description = managedToDo.value(forKey: "description") as! String
                
              //  let date = managedToDo.value(forKey: "title") as! Date
                
                let NewToDo = ToDo(title: title , description: description, date: nil)
                
                toDos.append(NewToDo)
            }
            try manageContext.save()
            print ("-------Done----------")
            print("toDos list from DB is \(toDos)")
            return toDos
            
        } catch {
            print ("ERROOOOORRR")
            return []
        }
        print("toDos list from DB is \(toDos)")
        return toDos
    }

    // update core data
    
    
    func updateToDo(todo : ToDo , index : Int){
                  
         guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
         
         let manageContext = applegate.persistentContainer.viewContext
        
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "ToDoEntity")
         
         do {
            
             let result = try manageContext.fetch(fetchRequest) as! [NSManagedObject]
             
             result[index].setValue(todo.title, forKey: "title")
             result[index].setValue(todo.description, forKey: "descrpition")
             result[index].setValue(todo.date, forKey: "date")
             try manageContext.save()
             
             print ("-------Done update----------")
             
         } catch {
             print ("ERROOOOORRR")
         }
     }
     
    
    // delete from core data
    
    func deleteToDo(index : Int){
                  
         guard let applegate = UIApplication.shared.delegate as? AppDelegate else {return}
         
         let manageContext = applegate.persistentContainer.viewContext
        
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "ToDoEntity")
         
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
     

}

