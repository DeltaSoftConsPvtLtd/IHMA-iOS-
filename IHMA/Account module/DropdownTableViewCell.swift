//
//  OTPTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 04/05/21.
//

import UIKit
import DropDown

class DropdownTableViewCell: UITableViewCell {

    @IBOutlet weak var dropdownView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblField: UILabel!
    
    let dropDown = DropDown()
    
    let statesArray = ["Karnataka","Kerala","Maharashtra"]
    let districtsArray = ["Trivandrum", "Ernakulam","Thrissur"]
    let chapterArray = ["Aloor","Vellangallur"]
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        listDown()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func listDown() {
        
        dropDown.anchorView = dropdownView
//        dropDown.dataSource = fruitsArray
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        // Action triggered on selection
//        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
//          print("Selected item: \(item) at index: \(index)")
//            self.lblTitle.text = fruitsArray[index]
//        }
    }
    func updateUI(){
        dropdownView.backgroundColor = UIColor.white
        lblTitle.textColor = hexToUiColor().hexStringToUIColor(hex:"333333")
        lblTitle.text = "Select"
    }

    //MARK:- add top and bottom border
    func addTopAndBottomBorders() {
       let thickness: CGFloat = 1.0
       let topBorder = CALayer()
       let leftSideBorder = CALayer()
       let rightSideBorder = CALayer()
       let bottomBorder = CALayer()
       topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.dropdownView.frame.size.width, height: thickness)
       topBorder.backgroundColor = UIColor.red.cgColor
       bottomBorder.frame = CGRect(x:0, y: self.dropdownView.frame.size.height - thickness, width: self.dropdownView.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor.red.cgColor
        leftSideBorder.backgroundColor = UIColor.red.cgColor
        dropdownView.layer.addSublayer(topBorder)
        dropdownView.layer.addSublayer(bottomBorder)
    }
    
    @IBAction func dropDownTap(_ sender: Any) {
        dropDown.show()
    }
}
