//
//  productListVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 21/02/24.
//

import UIKit

class productListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bannercoll: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register([productTVC.className])
        
        bannercoll.dataSource = self
        bannercoll.delegate = self
        bannercoll.register([probannerCVC.className])
        
    }
    
    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
}
extension productListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: productTVC = tableView.dequeueReusableCell(withIdentifier: productTVC.className, for: indexPath) as! productTVC
        
        cell.getpriceBtn.tag = indexPath.row
        cell.callBtn.tag = indexPath.row
        
        cell.getpriceBtn.addTarget(self, action: #selector(self.questionClicked(_:)), for: .touchUpInside)
        
        cell.callBtn.addTarget(self, action: #selector(self.questionClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func questionClicked(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! productTVC
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "getPriceVC") as! getPriceVC
         self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 252
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "productDetailVC") as! productDetailVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    }

extension productListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: probannerCVC = collectionView.dequeueReusableCell(withReuseIdentifier: probannerCVC.className, for: indexPath) as! probannerCVC
      
       
        
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
        
        return CGSize(width:  bannercoll.frame.size.width, height: bannercoll.frame.size.height)
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
