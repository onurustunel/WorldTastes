//
//  profileViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 1.04.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import Firebase
import SDWebImage



class profileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var titleArray = [String]()
    var shortDescArray = [String]()
    var userImageUrlArray = [String]()
     var documentIdArray = [String]()
    
    @IBOutlet weak var profileTableView: UITableView!
    var chosenCityName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenCityName = clickedName
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        getDataFromFirestore()
        

        // Do any additional setup after loading the view.
    }
    
 
 
     func getDataFromFirestore() {
     
     let fireStoreDatabase = Firestore.firestore()
     
     /*let settings = fireStoreDatabase.settings
     settings.areTimestampsInSnapshotsEnabled = true
     fireStoreDatabase.settings = settings
     */
     // let profilName = Auth.auth().currentUser?.email
     //  .order(by: "date", descending: true)
        
     let profilName = Auth.auth().currentUser?.email
     
     fireStoreDatabase.collection(chosenCityName).whereField("postedBy", isEqualTo: profilName).order(by: "date", descending: true).addSnapshotListener
     { (snapshot, error) in
     if error != nil {
     print(error?.localizedDescription)
     } else {
     if snapshot?.isEmpty != true && snapshot != nil {
     
     self.userImageUrlArray.removeAll(keepingCapacity: false)
     self.titleArray.removeAll(keepingCapacity: false)
     self.shortDescArray.removeAll(keepingCapacity: false)
     self.documentIdArray.removeAll(keepingCapacity: false)
    
     
     
     
     for document in snapshot!.documents {
     let documentID = document.documentID
     self.documentIdArray.append(documentID)
     
     
     
     if let placeName = document.get("placeName") as? String {
     self.titleArray.append(placeName)
     }
     
     if let shortDesc = document.get("shortDesc") as? String {
     self.shortDescArray.append(shortDesc)
     }
     
  
     
     if let imageUrl = document.get("imageUrl") as? String {
     self.userImageUrlArray.append(imageUrl)
     }
     
     
     }
     
     self.profileTableView.reloadData()
     
     }
     
     
     }
     }
     
     
     }
 
 
    // Bu kodlar ile sistemden çıkış yapıyoruz.
    // We log out of the account with these codes.
    

    @IBAction func logoutClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "fromLogoutVC", sender: nil)
            
        } catch {
            print("error")
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! profileTableViewCell
        
        
        cell.profileBigTitle.text = titleArray[indexPath.row]
        cell.profileShortDesc.text = shortDescArray[indexPath.row]
        cell.profileImageView.sd_setImage(with: URL(string: self.userImageUrlArray[indexPath.row]))
   
       
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 245
        
    }
    
    
    
    
    
    
    

}
