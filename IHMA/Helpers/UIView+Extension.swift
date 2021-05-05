//
//  UIView+Extension.swift
//  IHMA
//
//  Created by Nikil Davis on 28/04/21.
//

import UIKit

extension UIView {
    
    //MARK:- to round corners of a uiview
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
   
    
    
    
}

