//
//  feedTableViewCell.swift
//  girisdeneme
//
//  Created by MEHMET ONUR ÜSTÜNEL on 2.04.2020.
//  Copyright © 2020 MEHMET ONUR ÜSTÜNEL. All rights reserved.
//

import UIKit

class feedTableViewCell: UITableViewCell {

    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedTitle: UILabel!
    @IBOutlet weak var feedShortDesc: UILabel!
    
    /*
     Tıklanan şehir için bütün kullanıcıların eklediği mekanlar sıralanır. Bunları tableViewCell içerisinde tanımladık. feedViewController dosyasında Firebase'den veriyi çekip kullanıcıya göstereceğiz.
     
     The locations added by all users are listed for the city clicked. We have defined them in tableViewCell. In the feedViewController file, we will get the data from Firebase and show it to the user.
     
     */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
