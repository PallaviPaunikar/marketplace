//
//  productTVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 22/02/24.
//

import UIKit

class productTVC: UITableViewCell {
    
    @IBOutlet weak var getpriceBtn: UIButton!
    @IBOutlet weak var callBtn: UIButton!
    
    class var className : String { return "productTVC" }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
