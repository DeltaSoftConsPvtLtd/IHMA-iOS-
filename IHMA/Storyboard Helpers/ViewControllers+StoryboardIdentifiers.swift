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

//MARK:- Payment Page
extension PaymentViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "PaymentViewController"
    }
}
    
//MARK:- Profile page
extension ProfileViewController: StoryboardIdentifiable
    {
        static func storyboardIdentifier() -> String {
            return "ProfileViewController"
        }
}


//MARK:- OTP page
extension OTPViewController: StoryboardIdentifiable
    {
        static func storyboardIdentifier() -> String {
            return "OTPViewController"
        }
}

//MARK:- Tab page
extension MainTabPage: StoryboardIdentifiable
    {
        static func storyboardIdentifier() -> String {
            return "MainTabPage"
        }
}


//MARK:- Courses page
extension SideMenuViewController: StoryboardIdentifiable
    {
        static func storyboardIdentifier() -> String {
            return "SideMenuViewController"
        }
}


//MARK:- Notification page
extension NotificationViewController: StoryboardIdentifiable
    {
        static func storyboardIdentifier() -> String {
            return "NotificationViewController"
        }
}


//MARK:- Webview page
extension WebViewViewController: StoryboardIdentifiable
    {
        static func storyboardIdentifier() -> String {
            return "ViewController2"
        }
}
