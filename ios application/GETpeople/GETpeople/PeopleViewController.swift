//
//  ViewController.swift
//  GETpeople
//
//  Created by admin on 22/12/2021.
//

import UIKit


class PeopleViewController: UITableViewController {

        // Hardcoded data for now
        var people = ["Luke Skywalker", "Leia Organa", "Han Solo", "C-3PO", "R2-D2"]
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            let peopleData = NSData.init(contentsOfFile: "People.json")
            let dic = JSONSerialization.jsonObject(with: peopleData , options:[])
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        override func numberOfSections(in tableView: UITableView) -> Int {
            // if we return - sections we won't have any sections to put our rows in
            return 1
        }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // return the count of people in our data array
            return people.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create a generic cell
            let cell = UITableViewCell()
            // set the default cell label to the corresponding element in the people array
            cell.textLabel?.text = people[indexPath.row]
            // return the cell so that it can be rendered
            return cell
        }
    }

    /*
    var people = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        let url = URL(string: "")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {
            data ,response , error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options:
                   JSONSerialization ReadingOptions.mutableContainers) as? NSDictionary {
                    
               if let results = jsonResult["results"] as? NSArray {
                   
                   for person in results {
                       let personDic =   person as! NSDictionary
                       self.people.append(personDic["name"]! as! String)
                   }
                    
                }
                    
                } catch {
                    print (error)
                }

        })
        }
        


}
        */
     */
    }
