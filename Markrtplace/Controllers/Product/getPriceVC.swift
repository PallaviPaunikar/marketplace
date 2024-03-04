//
//  getPriceVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 27/02/24.
//

import UIKit

class getPriceVC: UIViewController {
    
    @IBOutlet weak var quantyColl: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        quantyColl.dataSource = self
        quantyColl.delegate = self
        quantyColl.register([quantityCollCell.className])
    }
    

    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }

}

extension getPriceVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: quantityCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: quantityCollCell.className, for: indexPath) as! quantityCollCell
      
       
        
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let numberOfItemsPerRow:CGFloat = 3
//            let spacingBetweenCells:CGFloat = 8
//
//            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
//
//        print(totalSpacing)
//
//            if let collection = self.galleryColl{
//                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//                return CGSize(width: width, height: width)
//            }else{
//                return CGSize(width: 0, height: 0)
//            }
//        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: quantyColl.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
     
    }
    
}
