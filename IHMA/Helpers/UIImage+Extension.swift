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
 }
