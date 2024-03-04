//
//  verifyOtpVC.swift
//  Markrtplace
//
//  Created by Pallavi Paunikar on 13/02/24.
//

import UIKit
import OTPFieldView
import SVProgressHUD
import Alamofire
import AlamofireObjectMapper


class verifyOtpVC: UIViewController {
    
    @IBOutlet weak var otpView: OTPFieldView!
    @IBOutlet weak var blurview: UIView!
    @IBOutlet weak var txtCode: UITextField!
    let apiclass = apiClass()
    
    var hasEnteredAllOtp: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        blurview.isHidden = true
        setupUI()
        
    }
    

    private func setupUI() {
        
        otpView.delegate = self
        otpView.fieldsCount = 4
        otpView.fieldSize = 70
        otpView.separatorSpace = 8
        otpView.displayType = .roundedCorner
        otpView.cursorColor = UIColor.getOrangeThemeColor
        otpView.defaultBackgroundColor = .white
        otpView.filledBackgroundColor = .white
        otpView.defaultBorderColor = .getboxcolor
        otpView.filledBorderColor = UIColor.getOrangeThemeColor
        otpView.fieldFont = UIFont(name: "Manrope-Medium", size: 14) ?? UIFont.boldSystemFont(ofSize: 24)
        otpView.otpInputType = .numeric
        otpView.initializeUI()
        
        otpView.becomeFirstResponder()
    }
    
    @IBAction func backbtnclicked(_ sender: Any)  {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnClicked(_ sender: Any)  {
        
       
      
        guard hasEnteredAllOtp else {
            AppUtil.showToast(message: "Please enter OTP.")
            return
        }
        guard let code = txtCode.text, !code.trim.isEmpty else {
            AppUtil.showToast(message: "Please enter OTP.")
            return
        }
        guard code.trim.count == 4 else {
            AppUtil.showToast(message: "Please enter valid OTP.")
            return
        }
       
        
      //  otpverifyCall()
       
        blurview.isHidden = false
    }

    @IBAction func successcontinueBtnClicked(_ sender: Any)  {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let vc = storyBoard.instantiateViewController(withIdentifier: "sliderSplashVC") as! sliderSplashVC
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

// MARK: - OTP Field View Delegate method's .
extension verifyOtpVC: OTPFieldViewDelegate {
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print("OTPString: \(otp)")
        txtCode.text = otp
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print("Has entered all OTP? \(hasEnteredAll)")
        hasEnteredAllOtp = hasEnteredAll
        return hasEnteredAll
    }
    
}

extension verifyOtpVC {
    
    private func otpverifyCall(){
        SVProgressHUD.show()
        let udid = UIDevice.current.identifierForVendor?.uuidString ?? ""
        print(udid)
        let url : String = apiclass.BaseUrl+apiclass.vrifyotp!
        let parameter:[String:Any]?  = ["mobile":"7972571378","otp":txtCode.text]
        
        
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
                        if LoginModel.success == "true" {
                            print(LoginModel.name)
                            
                            
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
extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print("response \(JSONString)")
        }
    }
}
