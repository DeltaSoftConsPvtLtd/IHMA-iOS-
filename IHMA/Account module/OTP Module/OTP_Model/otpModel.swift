//
//  otpModel.swift
//  IHMA
//
//  Created by Nikil Davis on 24/06/21.
//

import Foundation

struct otpModel : Codable {
    let otp : OTP?
    let data : [Data2]?

    enum CodingKeys: String, CodingKey {

        case otp = "otp"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        otp = try values.decodeIfPresent(OTP.self, forKey: .otp)
        data = try values.decodeIfPresent([Data2].self, forKey: .data)
    }

}
struct Data2 : Codable {
    let status : String?
    let return_to_url : String?
    let details : Details2?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case return_to_url = "return_to_url"
        case details = "details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        return_to_url = try values.decodeIfPresent(String.self, forKey: .return_to_url)
        details = try values.decodeIfPresent(Details2.self, forKey: .details)
    }

}

struct Details2 : Codable {
    let status : String?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case status = "Status"
        case token = "token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}


struct OTP : Codable {
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
