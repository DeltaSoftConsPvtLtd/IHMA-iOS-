//
//  EventsModel.swift
//  IHMA
//
//  Created by Nikil Davis on 26/06/21.
//

import Foundation

import Foundation
struct EventsModel : Codable {
    let status : StatusEvents?
    let data : [DataEvents]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(StatusEvents.self, forKey: .status)
        data = try values.decodeIfPresent([DataEvents].self, forKey: .data)
    }

}

struct DataEvents : Codable {
    let status : String?
    let return_to_url : String?
    let details : DetailsEvents?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case return_to_url = "return_to_url"
        case details = "details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        return_to_url = try values.decodeIfPresent(String.self, forKey: .return_to_url)
        details = try values.decodeIfPresent(DetailsEvents.self, forKey: .details)
    }

}

struct DetailsEvents : Codable {
    let notifications : [Notifications]?
    let events : [Events]?
    let flash_News : [Flash_News]?

    enum CodingKeys: String, CodingKey {

        case notifications = "Notifications"
        case events = "Events"
        case flash_News = "Flash_News"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        notifications = try values.decodeIfPresent([Notifications].self, forKey: .notifications)
        events = try values.decodeIfPresent([Events].self, forKey: .events)
        flash_News = try values.decodeIfPresent([Flash_News].self, forKey: .flash_News)
    }

}

struct Events : Codable {
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


struct Flash_News : Codable {
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

struct Notifications : Codable {
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

struct StatusEvents : Codable {
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

