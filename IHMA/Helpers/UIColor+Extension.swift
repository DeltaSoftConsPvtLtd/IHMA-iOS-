//
//  UIColor+Extension.swift
//  IHMA
//
//  Created by Nikil Davis on 03/05/21.
//

import UIKit

//Mark:- to give gradient colors

class Colors {
    var gl:CAGradientLayer!
    var gradient:CAGradientLayer!

    init() {
        let colorTop = UIColor(red: 0 / 255.0, green: 144.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        let colorMiddle = UIColor(red: 0 / 255.0, green: 125.0 / 255.0, blue: 221.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0 / 255.0, green: 102.0 / 255.0, blue: 182.0 / 255.0, alpha: 1.0).cgColor

        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop,colorMiddle, colorBottom]
        self.gl.locations = [0.0,0.5, 1.0]
        
        self.gradient = CAGradientLayer()
        self.gradient.colors = [colorTop, colorBottom]
        self.gradient.locations = [0.0, 1.0]
    }
}


