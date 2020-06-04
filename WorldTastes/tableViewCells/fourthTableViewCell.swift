//
//  fourthTableViewCell.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 26.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//

import UIKit

      var southAmericaCityArray = ["Buenos Aires","Rio de Janerio","Asuncion","Mendoza","Montevideo","Santiago","Sao Paulo"]

class fourthTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
   
    

    @IBOutlet weak var fourthCollectionViewCell: UICollectionView!
     var imageArray4 = [UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageArray4.append((UIImage(named: "buenosaires.jpg")!))
        imageArray4.append((UIImage(named: "rio.jpg")!))
        imageArray4.append((UIImage(named: "asuncion.jpg")!))
        imageArray4.append((UIImage(named: "mendoza.jpg")!))
        imageArray4.append((UIImage(named: "montevideo.jpg")!))
        imageArray4.append((UIImage(named: "santiago.jpg")!))
        imageArray4.append((UIImage(named: "saoPaulo.jpg")!))
       
        
        
        
        fourthCollectionViewCell.delegate = self
        fourthCollectionViewCell.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray4.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell4 = fourthCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "fourthCollectionViewCell", for: indexPath) as! fourthCollectionViewCell
        
        cell4.fourthImageView.image = imageArray4[indexPath.row]
        
        return cell4
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        clickedName = southAmericaCityArray[indexPath.row]
        
        
       // Artık kullanıcının hangi şehire tıkladığını biliyoruz. Bunu Navigation Item olarak göstereceğiz.
        
        // Now we know which city the user clicked on. We will show this as Navigation Item.
        
        
         // firstTableViewCell dosyasında clickedName class üzerinde tanımlandığı için burada kolayca ona erişebildim.
        
        // clickedName is global defined. So i could access  it easily in firstTableViewCell file.
        
        
    }

}
