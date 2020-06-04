//
//  profileTableViewCell.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 4.04.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {
    
    
    
    /*
     Tıklanan şehir için kullanıcının eklediği mekanlar sıralanır. Bunları tableViewCell içerisinde tanımladık. profileViewController dosyasında Firebase'den veriyi çekip kullanıcıya göstereceğiz. 
 
    The places which is added by user  are listed for the city clicked. We have defined them in tableViewCell. In profileViewController file, we will pull the data from Firebase and show it to the user.
 
 */

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileBigTitle: UILabel!
    
    @IBOutlet weak var profileShortDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
