//
//  ViewController.swift
//  RainbowRoad
//
//  Created by admin on 12/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let colorArr = [UIColor.red,UIColor.orange,UIColor.yellow, UIColor.green , UIColor.blue , UIColor.purple ]

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
        return 6
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        
        cell.backgroundColor = colorArr[indexPath.row]
        self.tableView.rowHeight = 120
    
        return cell
    }

}
