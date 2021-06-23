//
//  VideosTableViewCell.swift
//  IHMA
//
//  Created by Nikil Davis on 23/06/21.
//

import UIKit
import AVKit

class VideosTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    
    @IBOutlet weak var clickBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func comminInit(title:String, subTitle: String, videoUrl: String) {
        self.titleLbl.text = title
        self.subtitleLbl.text = subTitle
        
//        let url = URL(string: videoUrl)
//        self.getThumbnailFromVideoUrl(url: url!) { (thumbnailImage) in
//            self.thumbnailImageView.image = thumbnailImage
//        }
    }
    
    //MARK:- Get thumbnail
    func getThumbnailFromVideoUrl(url: URL, completion: @escaping ((_ image : UIImage?)->Void)) {
//        DispatchQueue.global().async {
            let asset = AVAsset()//AVAsset()
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
            
            avAssetImageGenerator.appliesPreferredTrackTransform = true
            
            let thumbnailTime = CMTimeMake(value: 2, timescale: 2)
            
            do {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumbnailTime, actualTime: nil)
                
                let thumbImage = UIImage(cgImage: cgThumbImage)
                
                DispatchQueue.main.async {
                    completion(thumbImage)
                }
            } catch {
                print(error.localizedDescription)
            }
//        }
    }
    
}
