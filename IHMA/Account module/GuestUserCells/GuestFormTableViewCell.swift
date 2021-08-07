//
//  GuestFormTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 06/08/21.
//

import UIKit

class GuestFormTableViewCell: UITableViewCell {

    @IBOutlet weak var GuestFieldView: UIView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var TxtField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
