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
        OTPView.layer.masksToBounds = true
        OTPView.layer.borderWidth = 2.0
        OTPView.layer.borderColor = .init(red: 130, green: 198, blue: 250, alpha: 0)//hexToUiColor().hexStringToUIColor(hex:"82C6FA")
    }

}
