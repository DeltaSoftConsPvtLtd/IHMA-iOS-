//
//  officeBearerTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 14/06/21.
//

import UIKit

class officeBearerTableViewCell: UITableViewCell {

    @IBOutlet weak var bearerView: UIView!
    
    @IBOutlet weak var lblBearer: UILabel!
    
    @IBOutlet weak var txtDesc: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- UI changes
        func updateUI(){
            bearerView.layer.cornerRadius = 30
            bearerView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"25A8E2")
        }

}
