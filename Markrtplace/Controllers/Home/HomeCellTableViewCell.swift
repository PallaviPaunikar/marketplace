//
//  HomeCellTableViewCell.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 25/02/24.
//

import UIKit

class HomeCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemcoll: UICollectionView!
    
    class var className : String { return "HomeCellTableViewCell" }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
