//
//  getList.swift
//  IHMA
//
//  Created by Nikil Davis on 29/05/21.
//

import Foundation
import UIKit
struct getList : Codable {
    let status : Status2?
    let data : [GetData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Status2.self, forKey: .status)
        data = try values.decodeIfPresent([GetData].self, forKey: .data)
    }

}


struct GetData : Codable {
    let status : String?
    let return_to_url : String?
//    let user : User1?
//    let expires_at : String?
//    let session_token : String?
    let details : Details1?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case return_to_url = "return_to_url"
//        case user = "user"
//        case expires_at = "expires_at"
//        case session_token = "session_token"
        case details = "details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        return_to_url = try values.decodeIfPresent(String.self, forKey: .return_to_url)
//        user = try values.decodeIfPresent(User1.self, forKey: .user)
//        expires_at = try values.decodeIfPresent(String.self, forKey: .expires_at)
//        session_token = try values.decodeIfPresent(String.self, forKey: .session_token)
        details = try values.decodeIfPresent(Details1.self, forKey: .details)
    }
}


    struct Details1 : Codable {
        let memberFee : [MemberFee]?
        let chapter : [Chapter]?
        let collage : [Collage]?

        enum CodingKeys: String, CodingKey {

            case memberFee = "MemberFee"
            case chapter = "Chapter"
            case collage = "Collage"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            memberFee = try values.decodeIfPresent([MemberFee].self, forKey: .memberFee)
            chapter = try values.decodeIfPresent([Chapter].self, forKey: .chapter)
            collage = try values.decodeIfPresent([Collage].self, forKey: .collage)
        }

    }

    struct MemberFee : Codable {
        let id : Int?
        let name : String?
        let amount : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case amount = "amount"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            amount = try values.decodeIfPresent(String.self, forKey: .amount)
        }

    }

    struct Chapter : Codable {
        let id : Int?
        let name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }

    }

    struct Collage : Codable {
        let id : Int?
        let name : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
        }

    }

    struct Status2 : Codable {
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

//    struct User1 : Codable {
//        let username : String?
//
//        enum CodingKeys: String, CodingKey {
//
//            case username = "username"
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            username = try values.decodeIfPresent(String.self, forKey: .username)
//        }
//
//    }
