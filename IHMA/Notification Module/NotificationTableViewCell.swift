//
//  NotificationTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 30/04/21.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var notificationCellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: dateView.bounds.height/2)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
