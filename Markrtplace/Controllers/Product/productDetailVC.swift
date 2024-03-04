//
//  productDetailVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 25/02/24.
//

import UIKit

class productDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func moreproductCLicked(_ sender: Any)  {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "moreProductDetailVC") as! moreProductDetailVC
         self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

}
