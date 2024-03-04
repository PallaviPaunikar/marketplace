//
//  loginCollCell.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 12/02/24.
//

import UIKit

class loginCollCell: UICollectionViewCell {
    
    @IBOutlet weak var elementtitle: UILabel!
    @IBOutlet weak var elementimg: UIImageView!

    class var className : String { return "loginCollCell" }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
