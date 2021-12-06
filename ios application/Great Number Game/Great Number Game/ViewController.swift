//
//  ViewController.swift
//  Great Number Game
//
//  Created by Norah on 06/12/2021.

// https://www.youtube.com/watch?v=uVCFV668dSQ



import UIKit

class ViewController: UIViewController {
    var guessedNumber = Int.random(in: 1...100)
    var answer : Int = 0
    var stringAnswer : String = ""
        
    @IBAction func sumbit(_ sender: UIButton) {
        stringAnswer = anwerTextField.text!
        answer = Int(stringAnswer)!
        
         if answer < guessedNumber {
             
             let alertController:UIAlertController = UIAlertController(title: "Incorrect", message: "\(answer) is Too Low", preferredStyle: UIAlertController.Style.alert)
             let alertAction:UIAlertAction = UIAlertAction(title: "Guess Again", style: UIAlertAction.Style.default, handler:nil)
             alertController.addAction(alertAction)
             present(alertController, animated: true, completion: nil)
             print("\(answer) < \(guessedNumber) ")
             // Accessing alert view backgroundColor :
             alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 203/255.0, alpha: 1)

        } else if answer > guessedNumber {
            print("\(answer) > \(guessedNumber) ")
            
            let alertController:UIAlertController = UIAlertController(title: "Incorrect", message: "\(answer) is Too High", preferredStyle: UIAlertController.Style.alert)
            let alertAction:UIAlertAction = UIAlertAction(title: "Guess Again", style: UIAlertAction.Style.default, handler:nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            // Accessing alert view backgroundColor :
            alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 255/255.0, green: 204/255.0, blue: 203/255.0, alpha: 1)
            
            
            
        } else {
            print("\(answer) = \(guessedNumber) ")
            
            let alertController:UIAlertController = UIAlertController(title: "Correct", message: "\(answer) Was Correct!!!!", preferredStyle: UIAlertController.Style.alert)
            let alertAction:UIAlertAction = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler:nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
            // Accessing alert view backgroundColor :
            alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 204/255.0, green: 255/255.0, blue: 204/255.0, alpha: 1)


            guessedNumber = Int.random(in: 1...100)
            
//
        }
            
    }
    @IBOutlet weak var anwerTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        anwerTextField.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    return true
        
    }
}
