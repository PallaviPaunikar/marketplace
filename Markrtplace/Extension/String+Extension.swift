//
//  String+Extension.swift
//  DeliveryKing
//

import Foundation

extension String {
    
    var boolValue: Bool {
        return NSString(string: self).boolValue
    }
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var noSpaceString: String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    //validate PhoneNumber
    var isPhoneNumber: Bool {
        let charcter  = NSCharacterSet(charactersIn: "+0123456789").inverted
        var filtered:NSString!
        let inputString:NSArray = self.components(separatedBy: charcter) as NSArray
        filtered = inputString.componentsJoined(by: "") as NSString
        return (self == filtered as String)
    }
    
    var isNumeric: Bool {
        return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
    }
    
    //Sejal
    func strikeThrough() -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: 1,
            range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }
    
    func convertStringToDate() -> Date? {
        let dateFormatter = DateFormatter()
        //        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from:"\(self)")
    }
    
    func getCurrentAppVersion() -> String {
        var appVersion = ""
        if let info = Bundle.main.infoDictionary {
            appVersion = info["CFBundleShortVersionString"] as? String ?? "Unknown"
        }
        return appVersion
    }
}

