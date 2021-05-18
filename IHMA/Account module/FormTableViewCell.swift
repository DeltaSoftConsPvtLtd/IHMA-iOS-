//
//  FormTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 04/05/21.
//

import UIKit

class FormTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var fieldView: UIView!
    @IBOutlet weak var lblField: UILabel!
    @IBOutlet weak var fieldTxt: UITextField!
    
    @IBOutlet weak var lblValidation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
