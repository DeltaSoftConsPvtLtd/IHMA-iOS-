//
//  OTPTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 04/05/21.
//

import UIKit

class OTPTableViewCell: UITableViewCell {

    @IBOutlet weak var OTPView: UIView!
    @IBOutlet weak var lblOTP: UILabel!
    @IBOutlet weak var txtOTP: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(){
        OTPView.layer.cornerRadius = 30
        OTPView.layer.borderWidth = 2.0
        OTPView.layer.borderColor = UIColor(red: 0.51, green: 0.78, blue: 0.98, alpha: 1.00).cgColor
        lblOTP.textColor = hexToUiColor().hexStringToUIColor(hex:"1B8AF4")
        txtOTP.addUnderLine()
    }

    //MARK:- add top and bottom border
    func addTopAndBottomBorders() {
       let thickness: CGFloat = 1.0
       let topBorder = CALayer()
       let leftSideBorder = CALayer()
       let rightSideBorder = CALayer()
       let bottomBorder = CALayer()
       topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.OTPView.frame.size.width, height: thickness)
       topBorder.backgroundColor = UIColor.red.cgColor
       bottomBorder.frame = CGRect(x:0, y: self.OTPView.frame.size.height - thickness, width: self.OTPView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor.red.cgColor
        leftSideBorder.backgroundColor = UIColor.red.cgColor
        OTPView.layer.addSublayer(topBorder)
        OTPView.layer.addSublayer(bottomBorder)
    }
}
