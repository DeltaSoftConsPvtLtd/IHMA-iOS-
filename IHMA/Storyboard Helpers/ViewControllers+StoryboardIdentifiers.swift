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
            return "WebViewViewController"
        }
}

//MARK:- About us view controller
extension AboutUsViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "AboutUsViewController"
            }
}


//MARK:- Reset Password view controller
extension EmailViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "EmailViewController"
            }
}

//MARK:- Home Screen View Controller
extension HomeScreenViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "HomeScreenViewController"
            }
}

//MARK:- Contact Screen View Controller
extension ContactUsViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "ContactUsViewController"
            }
}


//MARK:- Activities View Controller
extension ActivitiesViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "ActivitiesViewController"
            }
}


//MARK:- Chapters View Controller
extension ChaptersViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "ChaptersViewController"
            }
}


//MARK:- VideosViewController
extension VideosViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "VideosViewController"
            }
}



//MARK:- ReturnPolicyViewController
extension ReturnPolicyViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "ReturnPolicyViewController"
            }
}


//MARK:- PaymentDetailsViewController
extension PaymentDetailsViewController: StoryboardIdentifiable
{
    static func storyboardIdentifier() -> String {
        return "PaymentDetailsViewController"
            }
}
