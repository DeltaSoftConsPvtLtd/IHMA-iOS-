//
//  hyperLinkTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 01/07/21.
//

import UIKit

class hyperLinkTableViewCell: UITableViewCell {

    @IBOutlet weak var chaptersTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        
        // Initialization code
        updateTextView()
    }
    func updateUI() {
        chaptersTextView.backgroundColor = UIColor.white
        chaptersTextView.text = "To know more about chapters Click Here"
        chaptersTextView.font = UIFont(name: chaptersTextView.font!.fontName, size: 25)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateTextView() {
        let path = "https://www.ihma.in/chapters"
        let text = chaptersTextView.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "Click Here")
        chaptersTextView.attributedText = attributedString
    }
}
