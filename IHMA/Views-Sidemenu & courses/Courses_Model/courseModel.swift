//
//  courseModel.swift
//  IHMA
//
//  Created by Nikil Davis on 19/05/21.
//

import Foundation

struct courseModel : Codable {
    let status : courseStatus?
    let data : [courseData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(courseStatus.self, forKey: .status)
        data = try values.decodeIfPresent([courseData].self, forKey: .data)
    }

}

struct courseStatus : Codable {
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

struct courseData : Codable {
    let status : String?
    let return_to_url : String?
    let details : Details?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case return_to_url = "return_to_url"
        case details = "details"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        return_to_url = try values.decodeIfPresent(String.self, forKey: .return_to_url)
        details = try values.decodeIfPresent(Details.self, forKey: .details)
    }

}

struct Details : Codable {
    let courses : [Courses]?

    enum CodingKeys: String, CodingKey {

        case courses = "Courses"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        courses = try values.decodeIfPresent([Courses].self, forKey: .courses)
    }

}

struct Courses : Codable {
    let id : Int?
    let name : String?
    let slug : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case slug = "slug"
        case description = "description"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        description = try values.decodeIfPresent(String.self, forKey: .description)
    }

}
