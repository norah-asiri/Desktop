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
            
            let dic = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
             print (dic)
             if let results = dic["result"] as? [[String : Any]]{
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

/*
    // create a URLSession to handle the request tasks
    let session = URLSession.shared
    // create a "data task" to make the request and run the completion handler
    let task = session.dataTask(with: url!, completionHandler: {
        // see: Swift closure expression syntax
        data, response, error in
        print("in here")
        // see: Swift nil coalescing operator (double questionmark)
        print(data ?? "no data") // the "no data" is a default value to use if data is nil
    })
    // execute the task and wait for the response before
    // running the completion handler. This is async!
    task.resume()
}
 */


/*
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
*/

