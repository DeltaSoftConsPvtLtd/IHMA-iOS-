//
//  RegistrationModel.swift
//  IHMA
//
//  Created by Nikil Davis on 15/05/21.
//

import Foundation
import UIKit
struct RegistrationModel : Codable {
    let status : Status1?
    let data : [RegData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Status1.self, forKey: .status)
        data = try values.decodeIfPresent([RegData].self, forKey: .data)
    }
    

}


struct RegData : Codable {
    let status : String?
    let return_to_url : String?
    let user : Usertest?

   

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case return_to_url = "return_to_url"
        case user = "user"

      
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        return_to_url = try values.decodeIfPresent(String.self, forKey: .return_to_url)
        user = try values.decodeIfPresent(Usertest.self, forKey: .user)

       
    }

}



struct Status1 : Codable {
    let type : String?
    let message : String?
    let code : Int?
    let error : Bool?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case message = "message"
        case code = "code"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        error = try values.decodeIfPresent(Bool.self, forKey: .error)
    }

}


struct Usertest : Codable {
    let username : String?
    let email : String?
    let firstname : String?
    let id : Int?
    let lastname : String?

    enum CodingKeys: String, CodingKey {

        case username = "username"
        case email = "email"
        case firstname = "firstname"
        case id = "id"
        case lastname = "lastname"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
    }

}
