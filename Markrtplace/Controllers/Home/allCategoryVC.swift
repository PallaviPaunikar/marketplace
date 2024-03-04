//
//  allCategoryVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 21/02/24.
//

import UIKit

class allCategoryVC: UIViewController {
    
    @IBOutlet weak var galleryColl: UICollectionView!
    
    
    
    private let spacing:CGFloat = 0
    var elementTitleArr = ["Tableware","Uniform & Other Products","Food & Beverages Equipments","Fruits & Vegetables","Dairy Products","Chicken,Mutton & Egg","Marine Products","Grocery Food Products","Beverages","Marine Products","Grocery Food Products","Beverages","Tableware","Uniform & Other Products","Food & Beverages Equipments","Fruits & Vegetables","Dairy Products","Chicken,Mutton & Egg","Marine Products","Grocery Food Products","Beverages","Marine Products","Grocery Food Products","Beverages"]
    
    var elementImgArr = ["element1","element2","element3","catimg","element4","element5","element6","element7","element8","element6","element7","element8","element1","element2","element3","catimg","element4","element5","element6","element7","element8","element6","element7","element8"]

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
               layout.minimumLineSpacing = spacing
               layout.minimumInteritemSpacing = spacing
               self.galleryColl?.collectionViewLayout = layout
        
        galleryColl.dataSource = self
        galleryColl.delegate = self
        galleryColl.register([loginCollCell.className])
    }
    
    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension allCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
            let numberOfItemsPerRow:CGFloat = 3
            let spacingBetweenCells:CGFloat = 8
            
            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        print(totalSpacing)
            
            if let collection = self.galleryColl{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: width)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
      //  let vc: CustomizableItemPopoverVC = CustomizableItemPopoverVC.instantiate(appStoryboard: .dashboard)
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "subCategoryPopoverVC") as! subCategoryPopoverVC
             
        vc.dismissPopover = {
                       [unowned self] () in
                      // self.DoSomehing()
                       // call your method...
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                     let vc = storyBoard.instantiateViewController(withIdentifier: "productListVC") as! productListVC
                     self.navigationController?.pushViewController(vc, animated: true)
                   }
        
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController! as UIPopoverPresentationController
        popover.delegate = self
        popover.sourceView = self.view
        self.present(nav, animated: true, completion: nil)
    }
    
}

extension allCategoryVC: UIPopoverPresentationControllerDelegate {
    
    public func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("Popover dismisssed")
    }
}
