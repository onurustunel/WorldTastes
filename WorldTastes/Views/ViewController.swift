//
//  ViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 25.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {


    @IBOutlet weak var mailAddressText: UITextField!
    @IBOutlet weak var password1Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
   
    }

    @IBAction func signupClicked(_ sender: Any) {
 
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
       
    }
    
    
    @IBAction func loginClicked(_ sender: Any) {
        
        /*
         Kullanıcı daha önce kayıt olduysa bu kodlarla kendi hesabına giriş yapıyor.
 
 */
        /*
         
         If the user has already registered, The user logs into the account with these codes.
         
         
         */
        
        Auth.auth().signIn(withEmail: mailAddressText.text!, password: password1Text.text!) { (authdata, error) in
            
            if error != nil {
                
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                
                
            } else {
                
                if self.mailAddressText.text != nil && self.password1Text.text != nil {
                    self.performSegue(withIdentifier: "toFirstView1", sender: nil)
                    
                }
                    
                else {
                    
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "error")
                    
                    
                    
                }
                
                
            }
            
            
        }
  
        
        
        
        
        
    }
    
    
    
    
    
    
}

