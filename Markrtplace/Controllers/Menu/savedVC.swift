//
//  savedVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 28/02/24.
//

import UIKit

class savedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register([productTVC.className])
    }
    

    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }

}

extension savedVC: UITableViewDelegate, UITableViewDataSource {
    
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
