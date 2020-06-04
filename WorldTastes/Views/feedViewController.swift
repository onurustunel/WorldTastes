//
//  feedViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 27.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import Firebase
import SDWebImage



class feedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    /*
 
     SDWebImage ile firebase ile gelen görselleri kolayca gösterebiliyorum. Kullanışlı bir kütüphane.
 
 */
    

    @IBOutlet weak var listTableView: UITableView!
    var chosenCityName = String()
    
    //Arrays
    
    var titleArray = [String]()
    var shortDescArray = [String]()
    var longDescArray = [String]()
    var latitudeArray = [String]()
    var longitudeArray = [String]()
    var userImageUrlArray = [String]()
    var documentIdArray = [String]()
   
    //for Segues
    
    var selectedbigtitle = ""
    var selectedshortDesc = ""
    var selectedlongDesc = ""
    var selectedlatitude = ""
    var selectedlongitude = ""
    var selecteduserImageUrl = ""
    var selecteddocumentId = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chosenCityName = clickedName
        /*
         clickedName değişkeni String olarak firstTableViewCell içerisinde class üzerinde tanımlanmıştı. Şimdi onu chosenCityName değişkenine eşitleyerek Firebase'den veriyi çekilmesini sağlayacağız. Bu yöntem bize hem veri kaydederken hem de veri çekerken çok yardımcı oluyor.
         
         
         
         
         */
        
        
        listTableView.delegate = self
        listTableView.dataSource = self
        navigationItem.title = chosenCityName
          print("\(chosenCityName)")
        getDataFromFirestore() 
       
    }
    
    // ViewDidLoad olduğunda bu fonksiyonu çağırmayı unutma!
    
    
    func getDataFromFirestore() {
        
        let fireStoreDatabase = Firestore.firestore()
        
    // işte burada chosenCityName işimize yaradı.
        
        fireStoreDatabase.collection(chosenCityName).order(by: "date", descending: true).addSnapshotListener
        { (snapshot, error) in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    /*
                     aynı verileri sadece bir kez göstermek için
                     
                     to show the same data only once
 
 
 */
                    
                    self.userImageUrlArray.removeAll(keepingCapacity: false)
                    self.titleArray.removeAll(keepingCapacity: false)
                    self.shortDescArray.removeAll(keepingCapacity: false)
                    self.longDescArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    self.latitudeArray.removeAll(keepingCapacity: false)
                    self.longitudeArray.removeAll(keepingCapacity: false)
                    
                    
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                        
                    
                        
                        if let placeName = document.get("placeName") as? String {
                            self.titleArray.append(placeName)
                        }
                        
                        if let shortDesc = document.get("shortDesc") as? String {
                            self.shortDescArray.append(shortDesc)
                        }
                        
                        if let longDesc = document.get("longDesc") as? String {
                            self.longDescArray.append(longDesc)
                        }
                        
                        
                        if let latitude = document.get("latitude") as? String {
                            self.latitudeArray.append(latitude)
                        }
                        if let longitude = document.get("longitude") as? String {
                            self.longitudeArray.append(longitude)
                        }
                        
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageUrlArray.append(imageUrl)
                        }
                        
                        
                    }
                    
                    self.listTableView.reloadData()
                    
                }
                
                
            }
        }
   
        
    }

  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! feedTableViewCell
        
        cell.feedTitle.text = titleArray[indexPath.row]
        cell.feedShortDesc.text = shortDescArray[indexPath.row]
        cell.feedImage.sd_setImage(with: URL(string: self.userImageUrlArray[indexPath.row]))
      
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Tıklandığında detayları göstermek için hazırlık yapıyorum.
        
        selectedbigtitle = titleArray[indexPath.row]
        selectedshortDesc = shortDescArray[indexPath.row]
        selectedlongDesc = longDescArray[indexPath.row]
        selectedlatitude = latitudeArray[indexPath.row]
        selectedlongitude = longitudeArray[indexPath.row]
        selecteduserImageUrl = userImageUrlArray[indexPath.row]
        selecteddocumentId = documentIdArray[indexPath.row]
        
        performSegue(withIdentifier: "toFeedDetailVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFeedDetailVC" {
            
            // feedDetailViewController dosyamdaki değişkenlere eşitliyorum.
            
            // I am syncing the variables in my feedDetailViewController file.
            
            let destinationVC = segue.destination as! feedDetailViewController
         
            destinationVC.bigtitle = selectedbigtitle
            destinationVC.shortDesc = selectedshortDesc
            destinationVC.longDesc = selectedlongDesc
            destinationVC.latitude = selectedlatitude
            destinationVC.longitude = selectedlongitude
            destinationVC.userImageUrl = selecteduserImageUrl
            destinationVC.documentId = selecteddocumentId
            
            
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 245.0
        
    }
    


}
