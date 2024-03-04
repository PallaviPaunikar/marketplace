//
//  HomeVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 15/02/24.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var groceryColl: UICollectionView!
    @IBOutlet weak var listTable: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private let spacing:CGFloat = 8
    var elementTitleArr = ["Fruits & Vegetables","Dairy Products","Chicken,Mutton & Egg","Marine Products","Grocery Food Products","Beverages","Marine Products"]
    
    var elementImgArr = ["catimg","element4","element5","element6","element7","element8","element8"]

    override func viewDidLoad() {
        super.viewDidLoad()

//        let layout = UICollectionViewFlowLayout()
//               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
//               layout.minimumLineSpacing = spacing
//               layout.minimumInteritemSpacing = spacing
//               self.groceryColl?.collectionViewLayout = layout
        
        groceryColl.dataSource = self
        groceryColl.delegate = self
        groceryColl.register([grossCollCell.className])
        
        listTable.dataSource = self
        listTable.delegate = self
        listTable.register([HomeCellTableViewCell.className])
        
        tableViewHeight.constant = 210 * 10
        
    }
    
    @IBAction func allcategoryClicked(_ sender: Any)  {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "allCategoryVC") as! allCategoryVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func menuclicked(_ sender: Any)  {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "menuPageVC") as! menuPageVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return elementTitleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == groceryColl{
            
            let cell: grossCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: grossCollCell.className, for: indexPath) as! grossCollCell
            
            //        cell.elementtitle.text = elementTitleArr[indexPath.item]
            //        cell.elementimg.image = UIImage (named: elementImgArr[indexPath.item])
            
            return cell
        }else{
            let cell: grossCollCell = collectionView.dequeueReusableCell(withReuseIdentifier: grossCollCell.className, for: indexPath) as! grossCollCell
            
            //        cell.elementtitle.text = elementTitleArr[indexPath.item]
            //        cell.elementimg.image = UIImage (named: elementImgArr[indexPath.item])
            
            return cell
        }
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            let numberOfItemsPerRow:CGFloat = 4
//            let spacingBetweenCells:CGFloat = 0
//            
//            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
//        
//        print(totalSpacing)
//            
//            if let collection = self.groceryColl{
//                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//                return CGSize(width: width, height: width)
//            }else{
//                return CGSize(width: 0, height: 0)
//            }
//        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: groceryColl.frame.size.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HomeCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeCellTableViewCell.className, for: indexPath) as! HomeCellTableViewCell
        
        cell.itemcoll.dataSource = self
        cell.itemcoll.delegate = self
        cell.itemcoll.register([grossCollCell.className])
        
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 210
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    }

