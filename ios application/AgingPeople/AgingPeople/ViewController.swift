//
//  ViewController.swift
//  AgingPeople
//
//  Created by admin on 12/12/2021.
//

import UIKit

class ViewController: UIViewController {

    var aginPeople = [ AgingPeople(name:"Ali") ,
        AgingPeople(name:"Aliaa") ,
        AgingPeople(name:"Nor") ,
        AgingPeople(name:"Tom") ,
        AgingPeople(name:"Jod") ,
        AgingPeople(name:"Jojo") ,
        AgingPeople(name:"Rola") ,
        AgingPeople(name:"Majed") ,
        AgingPeople(name:"Mjd") ,
        AgingPeople(name:"Ameera") ,
        AgingPeople(name:"Tahani") ,
        AgingPeople(name:"Hasan") ,
                    
    ]
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
extension ViewController : UITableViewDataSource , UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aginPeople.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        
        cell.textLabel?.text = aginPeople[indexPath.row].name
        cell.detailTextLabel?.text = "\(aginPeople[indexPath.row].age)  years old"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        aginPeople.remove(at: indexPath.row)
        tableView.reloadData()
    }

    

}

class AgingPeople {
    let name : String
    let age : Int = Int.random(in: 5...95)
    
    init(name : String) {
        self.name = name
    }
}

