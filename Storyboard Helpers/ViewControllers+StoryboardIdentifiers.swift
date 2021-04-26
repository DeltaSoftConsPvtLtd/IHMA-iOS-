////
////  ViewControllers+StoryboardIdentifiers.swift
////  IHMA
////
////  Created by Nikil Davis on 23/04/21.
////

import Foundation

//MARK:- registration page
extension RegistrationViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "RegistrationViewController"
    }
}

//MARK:- Login page
extension LoginViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "LoginViewController"
    }
}
