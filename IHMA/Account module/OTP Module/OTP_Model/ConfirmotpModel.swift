//
//  ConfirmotpModel.swift
//  IHMA
//
//  Created by Nikil Davis on 24/06/21.
//

import Foundation

struct ConfirmotpModel : Codable {
    let confirm : Confirm?
    let data : [Data3]?

    enum CodingKeys: String, CodingKey {

        case confirm = "confirm"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        confirm = try values.decodeIfPresent(Confirm.self, forKey: .confirm)
        data = try values.decodeIfPresent([Data3].self, forKey: .data)
    }

}
struct Data3 : Codable {
    let status : String?
    let return_to_url : String?
    let details : Details3?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case return_to_url = "return_to_url"
        case details = "details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        return_to_url = try values.decodeIfPresent(String.self, forKey: .return_to_url)
        details = try values.decodeIfPresent(Details3.self, forKey: .details)
    }

}

struct Details3 : Codable {
    let status : String?
    let newPassword : String?

    enum CodingKeys: String, CodingKey {

        case status = "Status"
        case newPassword = "New Password"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        newPassword = try values.decodeIfPresent(String.self, forKey: .newPassword)
    }

}


struct Confirm : Codable {
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
