//
//  thirdTableViewCell.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 26.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//

import UIKit

    var northAmericaCityArray = ["Toronto","New York","Los Angeles","Las Vegas", "Cuba", "Bogota", "Chicago","Miami","Ottawa", "Philadelphia", "San Diego", "Washington"]


class thirdTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  
    
    
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    var imageArray3 = [UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
       
        imageArray3.append((UIImage(named: "toronto.jpg")!))
        imageArray3.append((UIImage(named: "newyork.jpg")!))
        imageArray3.append((UIImage(named: "losangeles.jpg")!))
        imageArray3.append((UIImage(named: "lasvegas.jpg")!))
        imageArray3.append((UIImage(named: "bogota.jpg")!))
        imageArray3.append((UIImage(named: "cuba.jpg")!))
        imageArray3.append((UIImage(named: "chicago.jpg")!))
        imageArray3.append((UIImage(named: "miami.jpg")!))
        imageArray3.append((UIImage(named: "ottawa.jpg")!))
        imageArray3.append((UIImage(named: "philadelphia.jpg")!))
        imageArray3.append((UIImage(named: "sanDiego")!))
        imageArray3.append((UIImage(named: "washington.jpg")!))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray3.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell3 = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: "thirdCollectionViewCell", for: indexPath) as! thirdCollectionViewCell
       
        cell3.thirdCollectionViewCell.image = imageArray3[indexPath.row]
        
        return cell3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         clickedName = northAmericaCityArray[indexPath.row]
        
        
        //Artık kullanıcının hangi şehire tıkladığını biliyoruz. Hatta bunu Navigation Item olarak yazdıracağız.
        
         // Now we know which city the user clicked on. We will show this as Navigation Item.
        
         // firstTableViewCell dosyasında clickedName class üzerinde tanımlandığı için burada kolayca ona erişebildim.
        
         // clickedName is global defined. So i could access  it easily in firstTableViewCell file.
    }

}
