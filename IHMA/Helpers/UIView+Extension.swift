//
//  UIView+Extension.swift
//  IHMA
//
//  Created by Nikil Davis on 28/04/21.
//

import UIKit

enum VerticalLocation: String {
    case bottom
    case top
}

extension UIView {
    
    //MARK:- to round corners of a uiview
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
   
    
    // MARK:- add dropshadow to a view
    func dropShadow(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E").cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: -1, height: 1)
      layer.shadowRadius = 5

      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
//   MARK:- to add shadow at top or bottom
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
          switch location {
          case .bottom:
               addShadow(offset: CGSize(width: 0, height: 2), color: color, opacity: opacity, radius: radius)
          case .top:
              addShadow(offset: CGSize(width: 0, height: -2), color: color, opacity: opacity, radius: radius)
          }
      }

      func addShadow(offset: CGSize, color: UIColor = hexToUiColor().hexStringToUIColor(hex:"6E6E6E"), opacity: Float = 0.5, radius: CGFloat = 1.0) {
          self.layer.masksToBounds = false
          self.layer.shadowColor = color.cgColor
          self.layer.shadowOffset = offset
          self.layer.shadowOpacity = opacity
          self.layer.shadowRadius = radius
      }
    //MARK:- add parent view controller
    var parentViewController: UIViewController? {
           var parentResponder: UIResponder? = self
           while parentResponder != nil {
               parentResponder = parentResponder!.next
               if let viewController = parentResponder as? UIViewController {
                   return viewController
               }
           }
           return nil
       }
    
    
}

