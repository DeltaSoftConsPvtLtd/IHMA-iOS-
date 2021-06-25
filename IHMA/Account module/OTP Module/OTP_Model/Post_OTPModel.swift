//
//  Post_OTPModel.swift
//  IHMA
//
//  Created by Nikil Davis on 24/06/21.
//

import Foundation

struct Post_OTPModel : Codable {
    let email : String?
    let token : String?
    let otp : String?

    enum CodingKeys: String, CodingKey {

        case email = "email"
        case token = "token"
        case otp = "otp"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        otp = try values.decodeIfPresent(String.self, forKey: .otp)
       
    }
    //Login
    init(email:String,token:String,otp:String) {
        self.email = email
        self.token = token
        self.otp = otp
    }

}

