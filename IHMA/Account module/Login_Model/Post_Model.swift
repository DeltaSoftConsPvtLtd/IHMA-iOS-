//
//  Post_Model.swift
//  IHMA
//
//  Created by Nikil Davis on 13/05/21.
//

import Foundation

struct Post_Model : Codable {
    let username : String?
    let password : String?

    enum CodingKeys: String, CodingKey {

        case username = "username"
        case password = "password"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        password = try values.decodeIfPresent(String.self, forKey: .password)
    }
    //Login
    init(username:String, password:String) {
        self.username = username
        self.password = password
    }

}

