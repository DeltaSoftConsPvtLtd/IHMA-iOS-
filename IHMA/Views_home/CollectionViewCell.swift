//
//  CollectionViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 12/25/20.
//

import Foundation
import UIKit

class PageCollectionViewCell:UICollectionViewCell{
    @IBOutlet var pageimage:UIImageView!
    @IBOutlet var pageLabel:UILabel!
    
    var content:Content!{
        didSet{
            pageimage.downloadImage(from:URL(string: "\(String(describing: content.image!))")!)
            pageLabel.text = content.first_name
            pageLabel.font = setFont(15.0)
        }
    }
}
