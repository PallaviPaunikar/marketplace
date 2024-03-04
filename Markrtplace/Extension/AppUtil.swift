//
//  AppUtil.swift
//  DeliveryKing
//

import UIKit
import JonAlert
import Reachability
import CoreLocation


class AppUtil: NSObject {
    
    class func isValidMobileNumber(_ phoneSring: String?) -> Bool {
        let mobileNumberPattern = "^[0-9]{10}$"
        let mobileNumberPred = NSPredicate(format: "SELF MATCHES %@", mobileNumberPattern)
        
        let result = mobileNumberPred.evaluate(with: phoneSring)
        return result
    }
    
    class func isValidateEmailAddress(_ email: String?) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,25}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    static func showToast(message: String, icon: String? = nil) {
        DispatchQueue.main.async {
            if icon != nil {
                JonAlert.show(message: message, andIcon: UIImage.init(named: icon!))
            }
            else {
                JonAlert.show(message: message)
            }
        }
    }
    
   
    
    
    
}

//MARK: - Reachability
extension AppUtil {
    class func isConnectedToNetwork() -> Bool {
        do {
            let reachability = try? Reachability()
            switch reachability!.connection {
            case .wifi:
                print("Connected With wifi")
                return true
            case .cellular:
                print("Connected With Cellular network(3G/4G)")
                return true
            case .none:
                print("Not Connected")
                return false
            case .unavailable:
                return false
            }
        }
    }
    
    class func showInternetNotConnectedDialogue() {
//        "It seems you are not connected to the internet, Kindly connect and try again."
        AppUtil.showToast(message: "It seems you are not connected to the internet, Kindly connect and try again.")
    }
}

//MARK: - Core Location
extension AppUtil {
    
  /*  static func fetchAddress(from location: CLLocation?, completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        guard let location = location else {
            completion(nil, nil)
            return
        }
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first else {
                completion(nil, error)
                return
            }
            completion(placemark, error)
        }
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(location.coordinate) { response, error in
            if let address = response?.firstResult() {
                
            }
            else {
                completion(nil, error)
            }
        }
    }*/
    
    
}
