//
//  homeTableViewCell.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 25.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//

import UIKit

  var clickedName = String()
/*
     clickedName isminde boş bir String oluşturdum. Bu şimdi gereksiz gibi görünse de verileri Firebase' ye kaydederken bize çok yardımcı olacak.
 
    I created an empty String named clickedName. Although this seems unnecessary now, it will help us a lot when saving the data to Firebase.
 
 
 */

  var europeCityArray = ["Rome","Paris","London","Barcelona", "Amsterdam","Berlin","Budapest","Istanbul","Lviv","Prague","Santorini","Venice","Vienna","Warsaw"]




class firstTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var homeCollectionViewCell: UICollectionView!
 

    var imageArray = [UIImage]()
    
  
    // to move the items
 
    override func awakeFromNib() {
        super.awakeFromNib()
        homeCollectionViewCell.delegate = self
        homeCollectionViewCell.dataSource = self
        
        imageArray.append((UIImage(named: "rome.jpg")!))
        imageArray.append((UIImage(named: "paris.jpg")!))
        imageArray.append((UIImage(named: "london.jpg")!))
        imageArray.append((UIImage(named: "barcelona.jpg")!))
        imageArray.append((UIImage(named: "amsterdam.jpg")!))
        imageArray.append((UIImage(named: "berlin.jpg")!))
        imageArray.append((UIImage(named: "budapest.jpg")!))
        imageArray.append((UIImage(named: "istanbul.jpg")!))
        imageArray.append((UIImage(named: "lviv.jpg")!))
        imageArray.append((UIImage(named: "prague.jpg")!))
        imageArray.append((UIImage(named: "santorini.jpg")!))
        imageArray.append((UIImage(named: "venice.jpg")!))
        imageArray.append((UIImage(named: "vienna.jpg")!))
        imageArray.append((UIImage(named: "warsaw.jpg")!))
        
    
        
    }

 /*    override  func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } */
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
       
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCollectionViewCell", for: indexPath) as! homeCollectionViewCell
        
       cell.imageViewCell.image = imageArray[indexPath.row] //
        
        
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        clickedName = europeCityArray[indexPath.row]
        //Artık kullanıcının hangi şehire tıkladığını biliyoruz. Hatta bunu Navigation Item olarak yazdıracağız.
        
         // Now we know which city the user clicked on. We will show this as Navigation Item.
       
        
     
        
    }
    
    
    
    
    
    
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 200)
        
        
    } */

}
