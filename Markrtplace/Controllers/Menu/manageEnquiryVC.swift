//
//  manageEnquiryVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 28/02/24.
//

import UIKit

class manageEnquiryVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register([manageEnqTVC.className])
    }
    

    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }


}

extension manageEnquiryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: manageEnqTVC = tableView.dequeueReusableCell(withIdentifier: manageEnqTVC.className, for: indexPath) as! manageEnqTVC
        
//        cell.getpriceBtn.tag = indexPath.row
//        cell.callBtn.tag = indexPath.row
//        
//        cell.getpriceBtn.addTarget(self, action: #selector(self.questionClicked(_:)), for: .touchUpInside)
//        
//        cell.callBtn.addTarget(self, action: #selector(self.questionClicked(_:)), for: .touchUpInside)
        
        return cell
    }
    
//    @objc func questionClicked(_ sender: UIButton) {
//        let indexPath = IndexPath(row: sender.tag, section: 0)
//        let cell = tableView.cellForRow(at: indexPath) as! productTVC
//        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//         let vc = storyBoard.instantiateViewController(withIdentifier: "getPriceVC") as! getPriceVC
//         self.navigationController?.pushViewController(vc, animated: true)
//        
//    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 160
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//         let vc = storyBoard.instantiateViewController(withIdentifier: "productDetailVC") as! productDetailVC
//         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    }
