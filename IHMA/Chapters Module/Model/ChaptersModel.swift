//
//  ChaptersModel.swift
//  IHMA
//
//  Created by Nikil Davis on 22/06/21.
//

import Foundation

struct ChaptersModel : Codable {
    let chapters : [Chapters]?

    enum CodingKeys: String, CodingKey {

        case chapters = "chapters"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chapters = try values.decodeIfPresent([Chapters].self, forKey: .chapters)
    }

}


struct Chapters : Codable {
    let state : String?
    let districts : [String]?

    enum CodingKeys: String, CodingKey {

        case state = "state"
        case districts = "districts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        districts = try values.decodeIfPresent([String].self, forKey: .districts)
    }

}
