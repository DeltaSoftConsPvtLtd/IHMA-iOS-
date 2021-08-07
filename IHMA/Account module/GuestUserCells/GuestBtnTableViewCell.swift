//
//  GuestBtnTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 07/08/21.
//

import UIKit

class GuestBtnTableViewCell: UITableViewCell {

    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
