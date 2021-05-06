//
//  loginModel.swift
//  IHMA
//
//  Created by Nikil Davis on 05/05/21.
//

import UIKit

struct loginPost: Encodable {
    let email: String
    let password: String
}

struct User: Decodable {
    let expiry: String?
    let token: String?

    }
