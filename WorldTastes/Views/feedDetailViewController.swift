//
//  feedDetailViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 3.04.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit
import SDWebImage

class feedDetailViewController: UIViewController {

    @IBOutlet weak var feedDetailImageView: UIImageView!
    @IBOutlet weak var feedDetailTitleLabel: UILabel!
    @IBOutlet weak var feedDetailShortDescLabel: UILabel!
    @IBOutlet weak var feedDetailLongDescLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
 
    var bigtitle = ""
    var shortDesc = ""
    var longDesc = ""
    var latitude = ""
    var longitude = ""
    var userImageUrl = ""
    var documentId = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedDetailTitleLabel.text = bigtitle
        feedDetailShortDescLabel.text = shortDesc
        feedDetailLongDescLabel.text = longDesc
        latitudeLabel.text = latitude
        longitudeLabel.text = longitude
        feedDetailImageView.sd_setImage(with: URL(string: userImageUrl))
        
        
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "toDetailMapVC" {
            let destinationVC = segue.destination as! detailMapViewController
            
            /*
             
            detailMapViewController dosyasında göstermek için burada enlem, boylam ve mekan ismini taşıyoruz.
            
            Here we carry the name of latitude, longitude and the name of place to show in detailMapViewController file.
             
             */
          
            destinationVC.chosenLatitude = latitudeLabel.text!
            destinationVC.chosenLongitude = longitudeLabel.text!
            destinationVC.chosenPlace = feedDetailTitleLabel.text!
            
        }
        
        
    }
    
    
    
    @IBAction func mapClicked(_ sender: Any) {
        performSegue(withIdentifier: "toDetailMapVC", sender: nil)
        
    }
    
    
    @IBAction func closeDetailClicked(_ sender: Any) {
        
         performSegue(withIdentifier: "toListVC", sender: nil)
    }
    
}
