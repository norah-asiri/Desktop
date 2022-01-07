//
//  RegisterViewController.swift
//  MessengerApp
//
//  Created by administrator on 04/01/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

   // private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.clipsToBounds = true
       //     return scrollView
      //  }()
        
      //  private let emailField: UITextField = {
            let emailField = UITextField()
        emailField.placeholder = "Email Address..."
          //  ...
        //    return field
        //}()
      //  private let passwordField: UITextField = {
            let passwordField = UITextField()
            //   ...
        passwordField.backgroundColor = .white
        passwordField.isSecureTextEntry = true
         //   return field
      //  }()
       // private let firstNameField: UITextField = {
            let firstNameField = UITextField()
          //  ...
          //  return field
       // }()
       // private let lastNameField: UITextField = {
            let lastNameField = UITextField()
              // ....
            // return field
    //    }()
        
        
        //private let registerButton: UIButton = {
            let button = UIButton()
            button.setTitle("Register", for: .normal)
            button.backgroundColor = .systemGreen
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
          //  return button
      //  }()
        
     //   private let imageView: UIImageView = {
            
            // Create the UIImageView object with frame
                let imageView = UIImageView()
                imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
            imageView.image = UIImage(systemName: "person")
            imageView.tintColor = .gray
            
                // set the image to aspect fit
        //    return imageView
        //}()
        
   
//
//            let label = UILabel()
//                label.frame = CGRect(x: 50, y: 50, width: 100, height: 30)
//                label.text = "Test Label"
//
//                // Add the label to the view controller's root view
//                self.view.addSubview(label)
            
//            emailField.delegate = self
//            passwordField.delegate = self
            
            // add subviews
          
            scrollView.addSubview(imageView)
            scrollView.addSubview(firstNameField)
            scrollView.addSubview(lastNameField)
            scrollView.addSubview(emailField)
            scrollView.addSubview(passwordField)
            scrollView.addSubview(button)
            self.view.addSubview(scrollView)
        }
}
