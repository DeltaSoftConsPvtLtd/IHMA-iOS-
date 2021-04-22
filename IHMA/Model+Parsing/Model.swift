//
//  Model.swift
//  IHMA
//
//  Created by Nikil Davis on 22/04/21.
//
import Foundation
struct Content : Codable {
    let id : Int?
    let first_name : String?
    let image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case first_name = "first_name"
        case image = "image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
