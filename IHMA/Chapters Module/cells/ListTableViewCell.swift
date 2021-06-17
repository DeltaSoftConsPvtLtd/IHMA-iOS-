//
//  ListTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 17/06/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblList: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
