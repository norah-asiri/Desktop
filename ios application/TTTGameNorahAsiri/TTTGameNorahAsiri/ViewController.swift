//
//  ViewController.swift
//  TTTGameNorahAsiri
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLable: UILabel!
    var player1 : [Int] = []
    var player2 : [Int] = []
    var tttGameTemp : [Int] = []
    var trak : Int = 0
    var winner : Bool = false

    @IBAction func restBtn(_ sender: UIButton) {
      setupUI()
    }
    
    @IBOutlet var gameButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    setupUI()
        
    }
    
    func setupUI(){
        winnerLable.text = ""
        player2 = []
        player1 = []
        trak = 0
        winner = false
        for aBtn in gameButton {
            aBtn.layer.backgroundColor = UIColor.lightGray.cgColor
            aBtn.isEnabled = true

        }
    }
    
    func disable(){
        for aBtn in gameButton {
            aBtn.isEnabled = false
        }
        
    }
    
    @IBAction func gameAction(_ sender: UIButton) {
        
        trak += 1
        
        
        if (trak % 2 == 0) {
            player2.append(sender.tag)
            sender.backgroundColor = .blue
            winner = tttGame(arr: player2)
            sender.isEnabled = false
            
            if (winner == true){
                winnerLable.text = "Congrats Blue Won"
                disable()
            }
            
        } else {
            
            
            player1.append(sender.tag)
            winner = tttGame(arr: player1)
            sender.backgroundColor = .red
            sender.isEnabled = false
            
            if (winner == true){
                winnerLable.text = "Congrats Red Won"
                disable()
            }
        }
        
        if trak == 9 && winner == false {
            winnerLable.text = "No Winner!"
       }
        
    }
    
    func tttGame (arr : [Int]) -> Bool {
        
      if(arr.count >= 3){
       tttGameTemp = arr
       tttGameTemp = tttGameTemp.sorted()
          if (tttGameTemp.contains(1) && tttGameTemp.contains(2) && tttGameTemp.contains(3))
          || (tttGameTemp.contains(1) && tttGameTemp.contains(4) && tttGameTemp.contains(7))
          || (tttGameTemp.contains(1) && tttGameTemp.contains(5) && tttGameTemp.contains(9))
          || (tttGameTemp.contains(2) && tttGameTemp.contains(5) && tttGameTemp.contains(8))
          || (tttGameTemp.contains(3) && tttGameTemp.contains(6) && tttGameTemp.contains(9))
          || (tttGameTemp.contains(3) && tttGameTemp.contains(5) && tttGameTemp.contains(7))
          || (tttGameTemp.contains(4) && tttGameTemp.contains(5) && tttGameTemp.contains(6))
          || (tttGameTemp.contains(7) && tttGameTemp.contains(8) && tttGameTemp.contains(9))
          {
            tttGameTemp = []
            return true
          }
        
            
        }
        
        return false }
    

}

