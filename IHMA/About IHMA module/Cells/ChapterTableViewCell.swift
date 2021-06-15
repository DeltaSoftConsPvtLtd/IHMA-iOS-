//
//  ChapterTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 14/06/21.
//

import UIKit

class ChapterTableViewCell: UITableViewCell {

    @IBOutlet weak var chapterView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtDescptn: UITextView!
    
    @IBOutlet weak var lblSeeMore: UILabel!
    @IBOutlet weak var btnSeeMore: UIButton!
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
            chapterView.layer.cornerRadius = 30
            chapterView.backgroundColor = hexToUiColor().hexStringToUIColor(hex:"25A8E2")
        }

}
