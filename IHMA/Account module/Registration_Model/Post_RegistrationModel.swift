//
//  Post_RegistrationModel.swift
//  IHMA
//
//  Created by Nikil Davis on 15/05/21.
//

import Foundation

struct Post_RegistrationModel : Codable {
    let first_name : String?
    let last_name : String?
    let registration_number : Int?
    let phone : Int?
    let address : String?
    let state : String?
    let districts : String?
    let collage_name : String?
    let membership_fee : Int?
    let status : String?
    let profile_pic : String?
    let user_type : String?
    let chapter : String?
    
    
    enum CodingKeys: String, CodingKey {

        case first_name = "first_name"
        case last_name = "last_name"
        case registration_number = "registration_number"
        case phone = "phone"
        case address = "address"
        case state = "state"
        case districts = "districts"
        case collage_name = "collage_name"
        case membership_fee = "membership_fee"
        case status = "status"
        case profile_pic = "profile_pic"
        case user_type = "user_type"
        case chapter = "chapter"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        registration_number = try values.decodeIfPresent(Int.self, forKey: .registration_number)
        phone = try values.decodeIfPresent(Int.self, forKey: .phone)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        districts = try values.decodeIfPresent(String.self, forKey: .districts)
        collage_name = try values.decodeIfPresent(String.self, forKey: .collage_name)
        membership_fee = try values.decodeIfPresent(Int.self, forKey: .membership_fee)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        profile_pic = try values.decodeIfPresent(String.self, forKey: .profile_pic)
        user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
        chapter = try values.decodeIfPresent(String.self, forKey: .chapter)
    }
    //Login
    init(first_name:String, last_name:String, registration_number:Int, phone:Int, address:String, state:String, districts:String, collage_name:String, membership_fee:Int, status:String, profile_pic:String, user_type:String, chapter:String) {
        self.first_name = first_name
        self.last_name = last_name
        self.registration_number = registration_number
        self.phone = phone
        self.address = address
        self.state = state
        self.districts = districts
        self.collage_name = collage_name
        self.membership_fee = membership_fee
        self.status = status
        self.profile_pic = profile_pic
        self.user_type = user_type
        self.chapter = chapter
    }

}
