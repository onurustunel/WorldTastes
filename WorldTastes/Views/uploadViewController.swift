//
//  uploadViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 31.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import Firebase

class uploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var addPhotoImage: UIImageView!
    @IBOutlet weak var addPhotoLabel: UILabel!
    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var longerDescText: UITextField!
    @IBOutlet weak var longerDescTextView: UITextView!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var shortDescLabel: UILabel!
    @IBOutlet weak var shortDescText: UITextField!
    
    
    var selectedUploadCityName = String()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedUploadCityName = clickedName
        
        
        latitudeLabel.text = clickedLatitude
        longitudeLabel.text = clickedLongitude
        print("uploadVC\(selectedUploadCityName)")
     
        
        addPhotoImage.isUserInteractionEnabled = true
        let imagePickerRecognizer = UITapGestureRecognizer(target: self, action: #selector(imagePick))
        addPhotoImage.addGestureRecognizer(imagePickerRecognizer)
     
        // ViewDidLoad
       
        hideKeyboardWhenTappedAround()
      
    }
    
    // Boş bir bölgeye tıklandığında klavyeyi gizler.
    
    // This code is hiding the keyboard when clicking on an empty area.
    
  
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc func imagePick(){
        
        
        // Galerimizden fotoğraf seçtik.
        
        // We chose photos from our gallery.
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        picker.delegate = self
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addPhotoImage.image = info[.originalImage] as? UIImage
        addPhotoLabel.isHidden = true
        
        self.dismiss(animated: true, completion: nil)
        
    }
 
    
    @IBAction func saveNextClicked(_ sender: Any) {
        
        selectedUploadCityName = clickedName
        print(selectedUploadCityName)
        
        /*
          clickedName değişkeni String olarak firstTableViewCell içerisinde class üzerinde tanımlanmıştı. Şimdi onu selectedUploadCityName değişkenine eşitleyerek Firebase'ye veriyi yüklerken selectedUploadCityName isminde bir child oluşturmasını sağlayacağız. Bu yöntem bize hem veri kaydederken hem de veri çekerken çok yardımcı oluyor.
         
         
         
         
         */
        
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        
        
        let mediaFolder = storageReference.child(selectedUploadCityName)
        
        
        
        if let data = addPhotoImage.image?.jpegData(compressionQuality: 0.1) {
            
            let uuid = UUID().uuidString
            //fotoğrafların farklı isimle kaydedilmesi için
            // for saving photos with a unique name
            
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            
            imageReference.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("Error")
                }              else {
                    
                    imageReference.downloadURL { (url, error) in
                        
                        if error == nil {
                            
                            let imageUrl = url?.absoluteString
                            
                            
                            //DATABASE
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreReference : DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser!.email!, "placeName" : self.placeNameText.text!,"shortDesc" : self.shortDescText.text!, "longDesc" : self.longerDescTextView.text!, "date" : FieldValue.serverTimestamp(), "latitude" : self.latitudeLabel.text!, "longitude" : self.longitudeLabel.text! ] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection(self.selectedUploadCityName).addDocument(data: firestorePost, completion: { (error) in
                                if error != nil {
                                    
                                  print("Error!")
                                    
                                } else {
                                    
                                    self.placeNameText.text = ""
                                    self.shortDescText.text = ""
                                    self.longerDescTextView.text = ""
                                    self.addPhotoImage.image = UIImage(named: "imageButton.png")
                                    self.addPhotoLabel.text = "Add Photo"
                                    self.addPhotoLabel.isHidden = false
                                    self.tabBarController?.selectedIndex = 0
                                    
                                
                                }
                            })
                            
                            
                            
                        }
                        
                        
                    }
                    
                }
            }
            
            
        }
        
        
     
    }
    
}
