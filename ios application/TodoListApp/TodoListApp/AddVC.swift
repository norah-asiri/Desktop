//
//  AddVC.swift
//  TodoListApp
//
//  Created by admin on 19/12/2021.
//

import UIKit
class AddVC : UIViewController {
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
        let newToDo = ToDo(title: titleTextField.text! , description: descriptionTextField.text, date: date)
       }


    
}


