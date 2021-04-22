//
//  Utils.swift
//  IHMA
//
//  Created by Nikil Davis on 12/25/20.
//

import Foundation
import UIKit

func setFont(_ size:CGFloat) -> UIFont{
    return UIFont(name:"TitilliumWeb-Light", size: size)!
}

func setFontRegular(_ size:CGFloat) -> UIFont{
    return UIFont(name:"TitilliumWeb-Regular", size: size)!
}

func loadImage (named: String) -> UIImage {

    if let data = try? Data(contentsOf: URL(string: named)!) {
            // Create Image and Update Image View
            let image = UIImage(data: data)
        return image ?? UIImage(named: "placeholder_for_missing_posters.jpg")!
        }
   
    return UIImage(named: "placeholder_for_missing_posters.jpg")!
}


extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}
