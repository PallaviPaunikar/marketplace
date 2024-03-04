//
//  LoginVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 12/02/24.
//

import UIKit
import SVProgressHUD
import Alamofire
import AlamofireObjectMapper

class LoginVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var bottomview: UIView!
    @IBOutlet weak var galleryColl: UICollectionView!
    @IBOutlet weak var continueview: UIView!
    @IBOutlet weak var continueviewBtn: UIButton!
    @IBOutlet weak var mobiletf: UITextField!
    let apiclass = apiClass()
    
    private let spacing:CGFloat = 0
    var elementTitleArr = ["Tableware","Uniform & Other Products","Food & Beverages Equipments","Fruits & Vegetables","Dairy Products","Chicken,Mutton & Egg","Marine Products","Grocery Food Products","Beverages","Marine Products","Grocery Food Products","Beverages"]
    
    var elementImgArr = ["element1","element2","element3","catimg","element4","element5","element6","element7","element8","element6","element7","element8"]


    override func viewDidLoad() {
        super.viewDidLoad()
        continueviewBtn.isEnabled = false
       // mobiletf.delegate = self
        mobiletf.addTarget(self, action: #selector(LoginVC.textFieldDidChange(_:)),
                                  for: .editingChanged)
        
        let layout = UICollectionViewFlowLayout()
               layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
               layout.minimumLineSpacing = spacing
               layout.minimumInteritemSpacing = spacing
               self.galleryColl?.collectionViewLayout = layout
        
        galleryColl.dataSource = self
        galleryColl.delegate = self
        galleryColl.register([loginCollCell.className])

//        bottomview.addGradient([UIColor (hexString: "#E3EFFF"),UIColor.white, UIColor.white], locations: [0.0,0.5,1.0],frame:bottomview.bounds)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
     
        
        if let text = textField.text {
            if text.count == 10 {
                
                continueviewBtn.isEnabled = true
                continueview.backgroundColor = UIColor (named: "ThemeColor")
                
            } else {
                
                continueviewBtn.isEnabled = false
                continueview.backgroundColor = UIColor (named: "GreyScale")
            }
        }
        
       
       
    }
    
    @IBAction func continueClicked(_ sender: Any)  {
        
       // loginapiCall()
        
        guard let email = mobiletf.text, !email.trim.isEmpty else {
            AppUtil.showToast(message: "Please enter mobile number.")
            return
        }
        if email.isNumeric {
            guard AppUtil.isValidMobileNumber(email) else {
                AppUtil.showToast(message: "Please enter valid mobile.")
                return
            }
        }
        else {
            guard AppUtil.isValidateEmailAddress(email) else {
                AppUtil.showToast(message: "Please enter valid email.")
                return
            }
        }
        
      //  loginapiCall()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "verifyOtpVC") as! verifyOtpVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension LoginVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
            let spacingBetweenCells:CGFloat = 0
            
            let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        print(totalSpacing)
            
            if let collection = self.galleryColl{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: width)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
    
    
}

extension LoginVC {
    
 /*   private func loginapiCall(){
        SVProgressHUD.show()
        let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        print(udid)
        let url : String = apiclass.BaseUrl+apiclass.login!
        let parameter:[String:Any]?  = ["mobile":"7972571378","deviceId":udid,"fcmId":"","hashKey":""]
        
        
        print(url)
        print(parameter)
        
        Alamofire.request(url, method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: nil).responseData { [self]
            response in
            SVProgressHUD.dismiss()
            
            switch response.result {
            case .success(let data):
                print(url)
                data.printJSON()
                do {
                    let decoder = JSONDecoder()
                    
                    let LoginModel = try decoder.decode(LoginModel.self, from: data)
                    
                    if response.response?.statusCode == 200 {
                        if LoginModel.success == true {
                            print(LoginModel.name)
                            
                            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                             let vc = storyBoard.instantiateViewController(withIdentifier: "verifyOtpVC") as! verifyOtpVC
                             self.navigationController?.pushViewController(vc, animated: true)
                            
                        } else {
                           
                        }
                    }
                } catch {
                    
                    return
                }
            case .failure(let error):
                
                //  SKActivityIndicator.dismiss()
                
                let msg = "URLSessionTask failed with error: The Internet connection appears to be offline."
                
                
                if error.localizedDescription == msg {
                    
                    //   SKActivityIndicator.dismiss()
                    self.alertModule(title: "", msg: "No internet connection")
                }else{
                    self.alertModule(title: "", msg: "\(error.localizedDescription)")
                    
                }
                
                
            }
        }
    }*/
    
    private func loginapiCall(){
        guard AppUtil.isConnectedToNetwork() else {
            AppUtil.showInternetNotConnectedDialogue()
            return
        }
        SVProgressHUD.show()
        let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        print(udid)
        let url : String = apiclass.BaseUrl+apiclass.login!
        let parameter:[String:Any]?  = ["mobile":"7972571378","deviceId":udid,"fcmId":"","hashKey":""]
        
        
        print(url)
        print(parameter)
        
       
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseData { [self]
            response in
            switch response.result {
              //  switch response.response?.statusCode == 200{
            case .success(let data):
                do {
//                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
//                        
//                        return
//                    }
//                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//                        
//                        return
//                    }
//                    guard String(data: prettyJsonData, encoding: .utf8) != nil else {
//                        
//                        return
//                    }

                    SVProgressHUD.dismiss()
                    if response.response?.statusCode == 200{
                        

//                        let dict :NSDictionary = jsonObject as NSDictionary
//                        
//                        print("screen api responce  = \(dict)")
//                        
//                        let dictdata = dict["Result"] as! String
//                        
//                        print("screen api responce  = \(dict)")
//                        if dictdata == "true" {
//                            
//                            
//                        }else{
//                            
//                           
//                        }
                        
                       // self.checkAndDisplayCartView()
                      //  hideProgress()
                        
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                         let vc = storyBoard.instantiateViewController(withIdentifier: "verifyOtpVC") as! verifyOtpVC
                         self.navigationController?.pushViewController(vc, animated: true)
                        
                        
                    }else{
                       // alert(message: "Api responce error", title: "")
                       // hideProgress()
                    }
                    
                } catch {
                    
                    return
                }
            case .failure(let error):
                
                //   SKActivityIndicator.dismiss()
                
                
                let msg = "URLSessionTask failed with error: The Internet connection appears to be offline."
                
                
                if error.localizedDescription == msg {
                    
                    //        SKActivityIndicator.dismiss()
                    
                  //  alert(message: "No internet connection", title: "")
                  //  hideProgress()
                }else{
                    
                   // alert(message: "\(error.localizedDescription)", title: "")
                  //  hideProgress()
                }
                
                
            }
        }
    }
    
    //MARK: alert Method
    
    func alertModule(title:String,msg:String){
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: {(alert : UIAlertAction!) in
            alertController.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
}

