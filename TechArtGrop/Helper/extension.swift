//
//  extension.swift
//  TechArtGrop
//
//  Created by THANEERATH T H on 25/07/23.
//

import Foundation
import UIKit


extension UIColor{
    
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
    
    
    
    
}

extension UIView {
    enum Corner:Int {
        case bottomRight = 0,
             topRight,
             bottomLeft,
             topLeft
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    
    private func parseCorner(corner: Corner) -> CACornerMask.Element {
        let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return corners[corner.rawValue]
    }
    
    private func createMask(corners: [Corner]) -> UInt {
        return corners.reduce(0, { (a, b) -> UInt in
            return a + parseCorner(corner: b).rawValue
        })
    }
    
    func roundCorners(corners: [Corner], radius: CGFloat = 20) {
        layer.cornerRadius = radius
        let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
        layer.maskedCorners = maskedCorners
    }
  
    
    func round(corner: UIRectCorner, radius: CGFloat) {
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    public func roundCornersBorders(_ cornerRadius: CGFloat, _ borderWidth: CGFloat, _ borderColor: CGColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    public func roundCorners(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
  
    
}




// MARK: String
extension String {
    
    ///
  var isEmail: Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
    let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
}
    ///VALIDATE THE CONTACT NUMBER-----
    var isPhoneNumber: Bool {
        let PHONE_REGEX = "^([()0-9]{6,15})?$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    
    
    // For charater limiting in UILabel
    func maxLength(length: Int) -> String {
        var str = self
        let nsString = str as NSString
        if nsString.length >= length {
            str = nsString.substring(with:
                                        NSRange(
                                            location: 0,
                                            length: nsString.length > length ? length : nsString.length)
            )
        }
        return  str
    }
    
  
}





