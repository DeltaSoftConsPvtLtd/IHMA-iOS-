//
//  StatesModel.swift
//  IHMA
//
//  Created by Nikil Davis on 29/05/21.
//

import Foundation
struct StatesModel : Codable {
    let states : [States]?

    enum CodingKeys: String, CodingKey {

        case states = "states"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        states = try values.decodeIfPresent([States].self, forKey: .states)
    }

}


struct States : Codable {
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
