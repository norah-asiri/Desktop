//
//  RegisterViewController.swift
//  MessengerApp
//
//  Created by administrator on 04/01/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//   // private let scrollView: UIScrollView = {
//            let scrollView = UIScrollView()
//            scrollView.clipsToBounds = true
//       //     return scrollView
//      //  }()
//
//      //  private let emailField: UITextField = {
//            let emailField = UITextField()
//        emailField.placeholder = "Email Address..."
//          //  ...
//        //    return field
//        //}()
//      //  private let passwordField: UITextField = {
//            let passwordField = UITextField()
//            //   ...
//        passwordField.backgroundColor = .white
//        passwordField.isSecureTextEntry = true
//         //   return field
//      //  }()
//       // private let firstNameField: UITextField = {
//            let firstNameField = UITextField()
//          //  ...
//          //  return field
//       // }()
//       // private let lastNameField: UITextField = {
//            let lastNameField = UITextField()
//              // ....
//            // return field
//    //    }()
//
//
//        //private let registerButton: UIButton = {
//            let button = UIButton()
//            button.setTitle("Register", for: .normal)
//            button.backgroundColor = .systemGreen
//            button.setTitleColor(.white, for: .normal)
//            button.layer.cornerRadius = 12
//            button.layer.masksToBounds = true
//            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
//          //  return button
//      //  }()
//
//     //   private let imageView: UIImageView = {
//
//            // Create the UIImageView object with frame
//                let imageView = UIImageView()
//                imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
//            imageView.image = UIImage(systemName: "person")
//            imageView.tintColor = .gray
//
//                // set the image to aspect fit
//        //    return imageView
//        //}()
//
//
////
////            let label = UILabel()
////                label.frame = CGRect(x: 50, y: 50, width: 100, height: 30)
////                label.text = "Test Label"
////
////                // Add the label to the view controller's root view
////                self.view.addSubview(label)
//
////            emailField.delegate = self
////            passwordField.delegate = self
//
//            // add subviews
//
//            scrollView.addSubview(imageView)
//            scrollView.addSubview(firstNameField)
//            scrollView.addSubview(lastNameField)
//            scrollView.addSubview(emailField)
//            scrollView.addSubview(passwordField)
//            scrollView.addSubview(button)
//            self.view.addSubview(scrollView)
        }
    
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // get results of user taking picture or selecting from camera roll
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self!.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self!.presentPhotoPicker()
        }))
        
        present(actionSheet, animated: true)
    }
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // take a photo or select a photo
        
        // action sheet - take photo or choose photo
        picker.dismiss(animated: true, completion: nil)
        print(info)
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        self.imageView.image = selectedImage
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

