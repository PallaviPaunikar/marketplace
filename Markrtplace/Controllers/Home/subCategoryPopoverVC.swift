//
//  subCategoryPopoverVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 22/02/24.
//

import UIKit

class subCategoryPopoverVC: UIViewController {
    
    @IBOutlet weak var subgalleryColl: UICollectionView!
    
    var dismissPopover: (() -> Void)?

    deinit {
        if let block = self.dismissPopover {
            block()
        }
    }
    
    
    
    private let spacing:CGFloat = 0
    var elementTitleArr = ["Tableware","Uniform","Food","Fruits","Dairy","Chicken","Marine Products","Grocery","Beverages","Marine","Grocery","Beverages","Tableware","Uniform","Food","Fruits","Dairy","Chicken,Mutton","Marine","Grocery","Beverages","Marine","Grocery","Beverages"]
    
    var elementImgArr = ["element1","element2","element3","catimg","element4","element5","element6","element7","element8","element6","element7","element8","element1","element2","element3","catimg","element4","element5","element6","element7","element8","element6","element7","element8"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
               layout.minimumLineSpacing = spacing
               layout.minimumInteritemSpacing = spacing
               self.subgalleryColl?.collectionViewLayout = layout
        
        subgalleryColl.dataSource = self
        subgalleryColl.delegate = self
        subgalleryColl.register([loginCollCell.className])
    }
    

    @IBAction func cancelbtnclicked(_ sender: Any)  {
        
        self.navigationController?.dismiss(animated: true)
    }
    
    

}

extension subCategoryPopoverVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return elementTitleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: loginCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCollCell.className, for: indexPath) as! loginCollCell
      
        cell.elementtitle.text = elementTitleArr[indexPath.item]
        cell.elementimg.image = UIImage (named: elementImgArr[indexPath.item])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let numberOfItemsPerRow:CGFloat = 4
            let spacingBetweenCells:CGFloat = 8
            
            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        print(totalSpacing)
            
            if let collection = self.subgalleryColl{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: width + 10)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      //  self.navigationController?.dismiss(animated: true)
        
       
        
        self.dismiss(animated: true)
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//         let vc = storyBoard.instantiateViewController(withIdentifier: "productListVC") as! productListVC
//         self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
