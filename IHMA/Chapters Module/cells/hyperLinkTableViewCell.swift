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
        // Initialization code
        updateTextView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateTextView() {
        let path = "https://mail.google.com/"
        let text = chaptersTextView.text ?? ""//demoTextView.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "Click Here")
        chaptersTextView.attributedText = attributedString
    }
}
