//
//  ResetPassword_Model.swift
//  IHMA
//
//  Created by Nikil Davis on 24/06/21.
//

import Foundation

struct ResetPassword_Model : Codable {
    let email : String?

    enum CodingKeys: String, CodingKey {

        case email = "email"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email)
       
    }
    //Login
    init(email:String) {
        self.email = email
    }

}
