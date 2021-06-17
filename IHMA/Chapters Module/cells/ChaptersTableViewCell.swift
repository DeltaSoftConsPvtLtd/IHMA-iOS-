//
//  ChaptersTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 17/06/21.
//

import UIKit
import DropDown

class ChaptersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dropDownView: UIView!
    @IBOutlet weak var lblList: UILabel!
    @IBOutlet weak var imgDownArrow: UIImageView!
    @IBOutlet weak var btnDropDown: UIButton!
    @IBOutlet weak var viewSeparator: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    let dropDown = DropDown()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        updateUI()
        listDown()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func listDown() {
        
        dropDown.anchorView = dropDownView
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
      
    }
    
    func updateUI(){
        dropDownView.backgroundColor = UIColor.white
        lblList.textColor = hexToUiColor().hexStringToUIColor(hex:"333333")
        lblList.text = "Select"
    }

    @IBAction func dropDownTap(_ sender: Any) {
        dropDown.show()
    }
}
