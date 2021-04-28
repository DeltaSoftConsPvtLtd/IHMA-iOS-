//
//  StoryboardIdentifierHandlerType.swift
//  ByHeart
//
//  Created by Jinto on 10/08/16.
//  Copyright © 2016 cloud nine. All rights reserved.
//

import UIKit

/**
 A protocol specific to the Lister sample that represents the segue identifier
 constraints in the app. Every view controller provides a segue identifier
 enum mapping. This protocol defines that structure.
 
 We also want to provide implementation to each view controller that conforms
 to this protocol that helps box / unbox the segue identifier strings to
 segue identifier enums. This is provided in an extension of `SegueHandlerType`.
 */
public protocol StoryboardIdentifierHandlerType {
    /**
     Gives structure to what we expect the segue identifiers will be. We expect
     the `SegueIdentifier` mapping to be an enum case to `String` mapping.
     
     For example:
     
     enum StoryboardIdentifier: String {
     case Bookmarks = "BookmarkesViewController"
     case ShowHelp    = "ShowHelp"
     ...
     }
     */
    associatedtype StoryboardIdentifier: RawRepresentable
}

/**
 A protocol specific to the Lister sample that represents the segue identifier
 constraints in the app. Every view controller provides a segue identifier
 enum mapping. This protocol defines that structure.
 
 We also want to provide implementation to each view controller that conforms
 to this protocol that helps box / unbox the segue identifier strings to
 segue identifier enums. This is provided in an extension of `SegueHandlerType`.
 */
public protocol StoryboardIdentifiable {
    
    static func storyboardIdentifier() -> String
    
}

extension StoryboardIdentifiable where Self: UIViewController {
    
    public static func instantiateViewControllerFromStoryboard(storyBoardName:String? = "Main") -> UIViewController? {
        return UIStoryboard.storyboard(storyBoardName:storyBoardName).instantiateViewController(withIdentifier: storyboardIdentifier())
    }
}
