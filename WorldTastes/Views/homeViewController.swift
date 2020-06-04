//
//  homeViewController.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 25.03.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//  twitter.com/onur_ustunel

import UIKit

class homeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
  
    @IBOutlet weak var homeTableView: UITableView!
    var imageArray = [UIImage]()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
      
      /*  imageArray.append((UIImage(named: "rome.jpg")!))
        imageArray.append((UIImage(named: "paris.jpg")!))
        imageArray.append((UIImage(named: "london.jpg")!))
        imageArray.append((UIImage(named: "barcelona.jpg")!))
        
        */
        
   
        
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        
       
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
         Burası önemli. Buradan TableViewCell kodlarıma ulaşıyorum.(as! firstTableViewCell koduyla)
         New File - Cocoa Touch Class - UITableViewCell
         This is important. I access my TableViewCell codes from here. (as! firstTableViewCell)
   
         */
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! firstTableViewCell
           
            
             return cell
            
        } else if indexPath.row == 1 {
            
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! secondTableViewCell
            return cell2
            
        }
        else if indexPath.row == 2 {
            
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! thirdTableViewCell
            return cell3
            
            
        }
        
        
        else {
            
            
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! fourthTableViewCell
            
            return cell4
            
          
        }
        
       
        
        
    }
    
    /*
    tableView hücrelerinin boyutu istediğin gibi olmazsa bu kod ile ayarlayabilirsin. (float cinsinden)
     
    If the size of the tableView cells is not what you want, you can adjust it with this code. (as float)
 */
    
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230.0
        
    }
    


 
}
