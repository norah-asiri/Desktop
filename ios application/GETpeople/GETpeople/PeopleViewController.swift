//
//  ViewController.swift
//  GETpeople
//
//  Created by admin on 22/12/2021.
//

import UIKit


class PeopleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let identifier = "PeopleCell"
    var finalResult : [PeopleInfo] = []
    let url = "https://swapi.py4e.com/api/people/"
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // specify the url that we will be sending the GET Request to
           //let url = URL(string: "https://swapi.dev/api/people/?format=json")
        tableView.dataSource = self
        getApi()
       
    }
    
    func getApi(){
        let urlSession = URLSession.shared
        guard let urlApi = URL.init(string: url) else { return}
        print ("pefore api")

        let task = urlSession.dataTask(with: urlApi){
             data , response , error in
            print ("during api")
            if error != nil {
                print("error")
            } else {
                self.parseLogic(data : data!)
            }
        }
        task.resume()
        print ("after api")

    }
    
    func parseLogic (data : Data) {
        do {
            
            let dict = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
             print (dict)
             if let results = dict["result"] as? [[String : Any]]{
                 for result in results {
                    parsePeopleInfo(dict: result)
        }
             }
        }catch {
                 print (error.localizedDescription)
             }
        
        func parsePeopleInfo (dict : [String : Any]){
            
        guard let name = dict["name"] as? String, let gender = dict["gender"] as? String,let birthYear = dict["birth_year"] as? String else {
            print ("Parsing falied")
            return
            //as PeopleInfo ?? PeopleInfo(name: "",  gender: "", birth_year: "")
        }
         
        let peopleInfo = PeopleInfo.init(name: name , gender: gender, birth_year: birthYear)
            finalResult.append(peopleInfo)
            print (peopleInfo)
        }
    }
     
}
       
struct PeopleInfo {
    let name : String
    let gender : String
    let birth_year : String
}

extension PeopleViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = finalResult[indexPath.row].name
        return cell
    }
    
    
}


