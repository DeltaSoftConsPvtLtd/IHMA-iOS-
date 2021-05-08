//
//  UITextfield+Extension.swift
//  IHMA
//
//  Created by Nikil Davis on 27/04/21.
//

import UIKit


extension UITextField {

    //MARK:- to add underline for text field
    func addUnderLine () {
           let bottomLine = CALayer()
           
           bottomLine.frame = CGRect(x: 0.0, y: self.bounds.height + 3, width: self.bounds.width, height: 1.5)
           bottomLine.backgroundColor = UIColor.lightGray.cgColor
           
           self.borderStyle = UITextField.BorderStyle.none
           self.layer.addSublayer(bottomLine)
       }
    
    func setPadding(of width: CGFloat) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.size.height))
        paddingView.backgroundColor = UIColor.clear
        self.leftViewMode = .always
        self.leftView = paddingView
    }
    
    

}
