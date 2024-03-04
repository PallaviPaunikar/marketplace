//
//  menuPageVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 27/02/24.
//

import UIKit

class menuPageVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func savedClicked(_ sender: Any)  {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "savedVC") as! savedVC
         self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func enquiryClicked(_ sender: Any)  {
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "manageEnquiryVC") as! manageEnquiryVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
