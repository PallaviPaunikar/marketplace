//
//  UITableView+Extension.swift
//  DeliveryKing
//

import UIKit

extension UITableView {

    func register(_ nibs: [String]) {
        nibs.forEach { (nib) in
            self.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: nib)
        }
    }
    
    func registerHeaders(_ nibs: [String]) {
        nibs.forEach { (nib) in
            self.register(UINib(nibName: nib, bundle: nil), forHeaderFooterViewReuseIdentifier: nib)
        }
    }
    
    func getDefaultCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
}
