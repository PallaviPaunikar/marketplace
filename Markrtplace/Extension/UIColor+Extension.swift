//
//  UIColor+Extension.swift
//  DeliveryKing
//

import UIKit

extension UIColor {

    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    class func RGBA(_ _r : CGFloat , _ _g : CGFloat, _ _b : CGFloat, _ _a : CGFloat) -> UIColor {
        return UIColor.init(red: _r/255.0, green: _g/255.0, blue: _b/255.0, alpha: _a)
    }
    
    public class var themeColor: UIColor {
        return UIColor(hexString: "#FC791A")
    }
    
    public class var appBackgroundColor: UIColor {
        return UIColor(hexString: "#FAFAFA")
    }
//
//    public class var separatorColor: UIColor {
//        return UIColor(hexString: "#F4F3F3")
//    }
    public class var getboxcolor: UIColor {
        return UIColor(hexString: "#A9B4BC")
    }
    
    public class var getOrangeThemeColor: UIColor {
            return UIColor(red: 0.165, green: 0.294, blue: 0.627, alpha: 1)
    }
    public class var getOrangeInvertThemeColor: UIColor {
            return UIColor(red: 0.165, green: 0.294, blue: 0.627, alpha: 1)
    }

}

extension UIView {
   func addGradient(_ colors: [UIColor], locations: [NSNumber], frame: CGRect = .zero) {

      // Create a new gradient layer
      let gradientLayer = CAGradientLayer()
      
      // Set the colors and locations for the gradient layer
      gradientLayer.colors = colors.map{ $0.cgColor }
      gradientLayer.locations = locations

      // Set the start and end points for the gradient layer
      gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
      gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)

      // Set the frame to the layer
      gradientLayer.frame = frame

      // Add the gradient layer as a sublayer to the background view
      layer.insertSublayer(gradientLayer, at: 0)
   }
}
