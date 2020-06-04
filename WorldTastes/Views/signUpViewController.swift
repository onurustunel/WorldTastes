//
//  signUpViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 25.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import Firebase


class signUpViewController: UIViewController {

    @IBOutlet weak var mailAddressText: UITextField!
   @IBOutlet weak var password1Text: UITextField!
   @IBOutlet weak var password2Text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpClicked(_ sender: Any) {
       // Yeni bir kullanıcı oluşturuyoruz.
        // We are creating a new user.
        
     
        
        if mailAddressText.text != "" && password1Text.text != "" && password2Text.text != "" && password1Text.text == password2Text.text {
            
            
             Auth.auth().createUser(withEmail: mailAddressText.text!, password: password1Text.text!) { (authdata, error) in
             
             if error != nil {
             
             self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
             
             
             }
             else {
             
             self.performSegue(withIdentifier: "toFirstView", sender: nil)
             // Başarılı bir şekilde anasayfaya giriş yapıldı.
                // Signed in successfully.
             
             
             }
             
             }
            
        }
        
        else {
            makeAlert(titleInput: "ERROR", messageInput: " There is a mistake!")
        }
        
    
        
    }
    
        
        
        func makeAlert(titleInput:String, messageInput:String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    
}
