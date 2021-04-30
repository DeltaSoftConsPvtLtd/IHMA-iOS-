//
//  UIView+Extension.swift
//  IHMA
//
//  Created by Nikil Davis on 28/04/21.
//

import UIKit

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    //MARK:- gradient colors
        func layerGradient() {
            let layer : CAGradientLayer = CAGradientLayer()
            layer.frame.size = self.frame.size
            layer.frame.origin = CGPoint(x: 0, y: 0)
            layer.cornerRadius = CGFloat(frame.width / 20)

            let color0 = UIColor(red:0/255, green:144/255, blue:255/255, alpha:0.5).cgColor
            let color1 = UIColor(red:0/255, green:125/255, blue: 221/255, alpha:0.1).cgColor
            let color2 = UIColor(red:0/255, green:102/255, blue: 182/255, alpha:0.1).cgColor
//            let color3 = UIColor(red:100.0/255, green:100.0/255, blue: 100.0/255, alpha:0.1).cgColor
//            let color4 = UIColor(red:50.0/255, green:50.0/255, blue:50.0/255, alpha:0.1).cgColor
//            let color5 = UIColor(red:0.0/255, green:0.0/255, blue:0.0/255, alpha:0.1).cgColor
//            let color6 = UIColor(red:150.0/255, green:150.0/255, blue:150.0/255, alpha:0.1).cgColor

            layer.colors = [color0,color1,color2]
            self.layer.insertSublayer(layer, at: 0)
        }
    
    
}
