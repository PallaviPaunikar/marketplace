//
//  UIView+Extension.swift
//  UClap_Customer
//

import UIKit

extension UIView {
    
    func makeCircular() {
        setCornerRadius(radius: self.frame.height / 2)
    }
    
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let rect = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        _ = CGSize(width: cornerRadius, height: cornerRadius)
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        self.layer.masksToBounds = true
    }
    func addnewshadow(top: Bool,left: Bool,bottom: Bool,right: Bool,shadowRadius: CGFloat = 5.0) {

        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 0.5

        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 2
        var viewWidth = UIScreen.main.bounds.width
        var viewHeight = self.frame.height

        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }

        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        path.close()
        self.layer.shadowPath = path.cgPath
      }
    
    func addShadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor;
        self.layer.shadowRadius = 2.0;
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.4;
        self.layer.masksToBounds = false;
    }
    
    func addDropShadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor;
        self.layer.shadowRadius = 2.0;
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowOpacity = 0.4;
        self.layer.masksToBounds = false;
    }

    func setBorder(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func setBorder(borderWidth: CGFloat, borderColor: UIColor) {
        
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func setGradient(startColor: UIColor, endColor : UIColor) {
        let gradientLayer0 = CAGradientLayer()
        gradientLayer0.frame = self.bounds
        gradientLayer0.colors = [startColor.cgColor, endColor.cgColor]
        self.layer.insertSublayer(gradientLayer0, at: 0)
        self.layer.masksToBounds = true
    }
    
    func removeGradientLayer() {
        self.layer.sublayers = self.layer.sublayers?.filter { theLayer in
            !theLayer.isKind(of: CAGradientLayer.classForCoder())
        }
    }
    
    func addContainerShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 4.0;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.masksToBounds = false;
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func drawDottedLine(_ cornerRadius: CGFloat? = nil) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
        if let cornerRadius = cornerRadius {
            shapeLayer.lineJoin = CAShapeLayerLineJoin.round
            shapeLayer.position = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
            shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        }
        else {
            shapeLayer.path = UIBezierPath(rect: bounds).cgPath
        }
        shapeLayer.frame = bounds
        layer.addSublayer(shapeLayer)
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        self.layer.add(animation, forKey: nil)
    }
}

@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
              layer.cornerRadius = newValue

              // If masksToBounds is true, subviews will be
              // clipped to the rounded corners.
              layer.masksToBounds = (newValue > 0)
        }
    }
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}
@IBDesignable
class DashedLineView : UIView {
    @IBInspectable var perDashLength: CGFloat = 2.0
    @IBInspectable var spaceBetweenDash: CGFloat = 2.0
    @IBInspectable var dashColor: UIColor = UIColor.lightGray


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let  path = UIBezierPath()
        if height > width {
            let  p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
            path.move(to: p0)

            let  p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
            path.addLine(to: p1)
            path.lineWidth = width

        } else {
            let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
            path.move(to: p0)

            let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
            path.addLine(to: p1)
            path.lineWidth = height
        }

        let  dashes: [ CGFloat ] = [ perDashLength, spaceBetweenDash ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)

        path.lineCapStyle = .butt
        dashColor.set()
        path.stroke()
    }

    private var width : CGFloat {
        return self.bounds.width
    }

    private var height : CGFloat {
        return self.bounds.height
    }
}
