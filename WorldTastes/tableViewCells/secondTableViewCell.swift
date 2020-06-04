//
//  secondTableViewCell.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 26.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//

import UIKit

var asianpeCityArray = ["Seoul","Bangkok","Hong Kong","Bali","Beijing","Burma","Kuala Lampur","Kyoto","Moscow","New Delhi","Singapore","Tokyo"]


class secondTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    

    
    @IBOutlet weak var secondCollectionViewCell: UICollectionView!
    var imageArray2 = [UIImage]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
        imageArray2.append((UIImage(named: "seoul.jpg")!))
        imageArray2.append((UIImage(named: "bangkok.jpg")!))
        imageArray2.append((UIImage(named: "hongkong.jpg")!))
        imageArray2.append((UIImage(named: "bali.jpg")!))
        imageArray2.append((UIImage(named: "beijing.jpg")!))
        imageArray2.append((UIImage(named: "burma.jpg")!))
        imageArray2.append((UIImage(named: "kualaLampur")!))
        imageArray2.append((UIImage(named: "kyoto.jpg")!))
        imageArray2.append((UIImage(named: "moscow.jpg")!))
        imageArray2.append((UIImage(named: "newDelhi.jpg")!))
        imageArray2.append((UIImage(named: "singapore.jpg")!))
        imageArray2.append((UIImage(named: "tokyo.jpg")!))
        
        
        
        
        secondCollectionViewCell.delegate = self
        secondCollectionViewCell.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray2.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = secondCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "secondCollectionViewCell", for: indexPath) as! secondCollectionViewCell
        
        cell2.secondImageView.image = imageArray2[indexPath.row]
        
        
        
        return cell2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         clickedName = asianpeCityArray[indexPath.row]
       
        //Artık kullanıcının hangi şehire tıkladığını biliyoruz. Hatta bunu Navigation Item olarak yazdıracağız.
        
         // Now we know which city the user clicked on. We will show this as Navigation Item.
        
        // firstTableViewCell dosyasında clickedName class üzerinde tanımlandığı için burada kolayca ona erişebildim.
        
        // clickedName is global defined. So i could access  it easily in firstTableViewCell file.
        
        
        
        
        
        
        
        
    }
    
    
    
    

}
