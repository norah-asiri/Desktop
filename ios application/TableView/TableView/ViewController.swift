//
//  ViewController.swift
//  TableView
//
//  Created by admin on 12/12/2021.
//

import UIKit

class ViewController: UIViewController{
    //UITableViewDataSource
    // Create this array at the top of your class as a property
    var tasks = ["Exercise for 30 minutes", "Wireframe for some project", "Do laundry"]

    @IBAction func beasButtonPressed(_ sender: UIButton) {
        var newTask : String = ""
        newTask = taskTextField.text!
        if newTask.isEmpty {
            print("Please add task")
        } else {
            tasks.append(newTask)
        }
        
        tableView.reloadData()

    }
    @IBOutlet weak var taskTextField: UITextField!
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: UITableViewDataSource , UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }

    

}

