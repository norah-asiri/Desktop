//
//  ViewController.swift
//  TodoListApp
//
//  Created by admin on 19/12/2021.
//

import UIKit
import CoreData

class ToDoVC: UITableViewController {

    let todeTest = ToDo(title: "test", description: "teeeeeeest", date : "1-1-21")
    let toDoUpdate = ToDo(title: "UPDATEtest", description: "teeeeeeestUuuuuuup", date: "1-1-21")
    var getToDoList : [ToDo] = []
    
    
    
    
    // <#Date #>
    //date: <#20/11/2021#>
    //, date: <#20/11/2021#>
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       print("STAAAAAAART")
       storeToDo(todo: todeTest)
       getToDoList = getToDo()
       updateToDo(todo: toDoUpdate , index: 0)
       deleteToDo(index: 0)
       tableView.reloadData()
        
    }
    
  
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getToDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        
        cell.titleLabel.text = getToDoList[indexPath.row].title
        cell.dateLabel.text = "   \(String(describing: getToDoList[indexPath.row].date))"
        cell.descriptionLabel.text = getToDoList[indexPath.row].description
     
        // dequeue the cell from our storyboard
        //let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
       // cell.
       // cell.textLabel?.text = todeTest.title
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if   tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark
                
        {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        
        }
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
            print ("-------Save Done----------")
            
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
                
                let date = managedToDo.value(forKey: "date") as! String
                
            
                
                let NewToDo = ToDo(title: title , description: description, date: date)
                
                toDos.append(NewToDo)
            }
            try manageContext.save()
            print ("------- update Done----------")
            
            for i in toDos{
                print("\(i.title) \n \(i.description) \n \(i.date)")
                      
                      }
            return toDos
            
        } catch {
            print ("ERROOOOORRR")
            return []
        }
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
             
        
             print("\n \(todo.title) \n \(todo.description) \n \(todo.date)")
             
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

