//
//  PhotosTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 05/07/21.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var imageDisplay: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        // Initialization code
    }

    func updateUI() {
        imageDisplay.roundCorners()
    }
    
}
