//
//  AddVC.swift
//  TodoListApp
//
//  Created by admin on 19/12/2021.
//

import UIKit
class AddVC : UIViewController {
    var newToDo : ToDo = ToDo(title:"", description: "", date: "")
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
           let formatter = DateFormatter()
           //formatter.dateStyle = .medium
           //formatter.timeStyle = .none
           formatter.dateFormat = "dd/mm/yyyy"
           // send date
           let date = "\(formatter.string(from: datePicker.date))"
           print ("Selected date = \(date)")
           newToDo = ToDo(title: titleTextField.text! , description: descriptionTextField.text, date: date)
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier:"ToDoVC") as! ToDoVC
        
        // let destination = segue.destination as! ToDoVC
        vc.storeToDo(todo: newToDo)
        print ("********************************************** new todo is added : \(newToDo.title)")
       
      // present(destination, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc , animated:true)
        dismiss(animated: true, completion: nil)
        
       }
    }
    


    



