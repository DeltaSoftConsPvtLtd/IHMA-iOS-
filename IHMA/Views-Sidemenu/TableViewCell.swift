//
//  TableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 27/04/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewCourse: UIView!
    @IBOutlet weak var lblCourse: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
//        viewCourse.borderStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//MARK:- UI changes
    func updateUI(){
        viewCourse.layer.cornerRadius = 30
        viewCourse.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"25A8E2")
    }
}
