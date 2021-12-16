//
//  ViewController.swift
//  BinaryCounter
//
//  Created by admin on 16/12/2021.
//

import UIKit

class ViewController: UIViewController {
    var total : Int = 0
    
    @IBOutlet weak var totalLabel: UILabel!
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalLabel.text = "Total: \(total)"
        tableView.dataSource = self
        tableView.delegate = self
    
    }
        //tableView.reloadData()
    


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
}
    
}

extension ViewController: UITableViewDataSource , UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 16 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"binaryCell", for: indexPath) as! CustomCellBinary
        cell.delegate = self
        cell.powerLabel.text = "\(pow(10,indexPath.row))"

        
        return cell
    }
    
}

extension ViewController : CustomCellBinaryDelegate{
    func totalValueChanged(value: Int) {
        self.total += value
        totalLabel.text = "Total: \(self.total)"
    }
}
