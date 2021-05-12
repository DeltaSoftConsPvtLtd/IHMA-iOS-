//
//  UserModel.swift
//  IHMA
//
//  Created by Nikil Davis on 12/05/21.
//


import Foundation
struct LoginModel : Codable {
    let status : Status?
    let data : [Data1]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Status.self, forKey: .status)
        data = try values.decodeIfPresent([Data1].self, forKey: .data)
    }

}


struct Data1 : Codable {
    let status : String?
    let return_to_url : String?
    let user : User?
    let expires_at : String?
    let session_token : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case return_to_url = "return_to_url"
        case user = "user"
        case expires_at = "expires_at"
        case session_token = "session_token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        return_to_url = try values.decodeIfPresent(String.self, forKey: .return_to_url)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        expires_at = try values.decodeIfPresent(String.self, forKey: .expires_at)
        session_token = try values.decodeIfPresent(String.self, forKey: .session_token)
    }

}



struct Status : Codable {
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


struct User : Codable {
    let username : String?

    enum CodingKeys: String, CodingKey {

        case username = "username"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        username = try values.decodeIfPresent(String.self, forKey: .username)
    }

}
