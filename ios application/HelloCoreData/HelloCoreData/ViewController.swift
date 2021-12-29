//
//  ViewController.swift
//  HelloCoreData
//
//  Created by admin on 29/12/2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBAction func saveUser(_ sender: UIButton) {
        let user = User(context: managedObjectContext)
    
        user.firstName = "Bob"
        user.email = "Bob@bobmail.com"
    
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success!")
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    
    }
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let users = [
                   ["firstName": "John", "email": "john.blake@example.com"],
                   ["firstName": "Rodney", "email": "rodney.roberts20@example.com"]
               ]
               users.forEach {
                   user in
                   let newUser = User(context: managedObjectContext) // Should have been declared as a constant within the ViewController's scope
                   newUser.firstName = user["firstName"]
                   newUser.email = user["email"]
                   do {
                       try managedObjectContext.save()
                       print("Success")
                   } catch {
                       print("Unresolved error \(error)")
                       abort()
                   }
        
        
    }


}

}
