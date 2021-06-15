//
//  ActivityTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 15/06/21.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var lblActivity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
