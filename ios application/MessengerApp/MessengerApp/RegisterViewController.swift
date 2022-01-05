//
//  RegisterViewController.swift
//  MessengerApp
//
//  Created by administrator on 04/01/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.clipsToBounds = true
            return scrollView
        }()
        
        private let emailField: UITextField = {
            let field = UITextField()
            field.placeholder = "Email Address..."
          //  ...
            return field
        }()
        private let passwordField: UITextField = {
            let field = UITextField()
            //   ...
            field.backgroundColor = .white
            field.isSecureTextEntry = true
            return field
        }()
        private let firstNameField: UITextField = {
            let field = UITextField()
          //  ...
            return field
        }()
        private let lastNameField: UITextField = {
            let field = UITextField()
              // ....
            return field
        }()
        
        
        private let registerButton: UIButton = {
            let button = UIButton()
            button.setTitle("Register", for: .normal)
            button.backgroundColor = .systemGreen
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
            return button
        }()
        
        private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "person")
            imageView.tintColor = .gray
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
          
            emailField.delegate = self
            passwordField.delegate = self
            
            // add subviews
            view.addSubview(scrollView)
            scrollView.addSubview(imageView)
            scrollView.addSubview(firstNameField)
            scrollView.addSubview(lastNameField)
            scrollView.addSubview(emailField)
            scrollView.addSubview(passwordField)
            scrollView.addSubview(registerButton)
        }
}
