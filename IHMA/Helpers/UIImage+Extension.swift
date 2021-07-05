//
//  UIImage+Extension.swift
//  IHMA
//
//  Created by Nikil Davis on 27/04/21.
//

import UIKit

//MARK:- to make an image rounded
extension UIImageView {
    func makeRounded() {
        let radius = self.frame.width/2.0
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
  
    //MARK:- to change image tint color
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
      }
    
    //MARK:- to round corners of an image rounded
    func roundCorners() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
 }
