//
//  UIStoryboard+Helpers.swift
//  ByHeart
//
//  Created by iOS Developer on 10/08/16.
//  Copyright © 2016 cloud nine. All rights reserved.
//

import UIKit


extension UIStoryboard {
    
    /// Returns an instance of the main storyboard
    static func storyboard(storyBoardName:String!) -> UIStoryboard {
        return UIStoryboard(name: storyBoardName, bundle: Bundle.main)
    }
    
}





