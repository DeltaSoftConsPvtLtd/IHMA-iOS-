//
//  ChaptersModel.swift
//  IHMA
//
//  Created by Nikil Davis on 22/06/21.
//

import Foundation

struct ChaptersModel : Codable {
    let districts : [Districts]?

    enum CodingKeys: String, CodingKey {

        case districts = "districts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        districts = try values.decodeIfPresent([Districts].self, forKey: .districts)
    }

}


struct Districts : Codable {
    let district : String?
    let chapters : [String]?

    enum CodingKeys: String, CodingKey {

        case district = "district"
        case chapters = "chapters"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        district = try values.decodeIfPresent(String.self, forKey: .district)
        chapters = try values.decodeIfPresent([String].self, forKey: .chapters)
    }

}
