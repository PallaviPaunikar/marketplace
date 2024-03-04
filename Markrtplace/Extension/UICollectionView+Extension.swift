//
//  UICollectionView+Extension.swift
//  DeliveryKing


import UIKit

extension UICollectionView {

    func register(_ nibs: [String]) {
        nibs.forEach { (nib) in
            self.register(UINib(nibName: nib, bundle: nil), forCellWithReuseIdentifier: nib)
        }
    }
    
    func registerHeaders(_ nibs: [String]) {
        nibs.forEach { (nib) in
            self.register(UINib(nibName: nib, bundle: nil), forSupplementaryViewOfKind: nib, withReuseIdentifier: nib)
        }
    }
    
}
