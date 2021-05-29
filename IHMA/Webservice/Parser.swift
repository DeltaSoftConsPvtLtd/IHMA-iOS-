//
//  Parser.swift
//  Test
//
//  Created by Mac Book on 12/25/20.
//

import Foundation
typealias Oncompletion = (_ sucess:Bool,_ msg:String,_ Resp:Any) -> Void
class Parser{
    static let shared = Parser()
    private init(){
    }
    func parserFile(_ filename:String,completion:Oncompletion){
        let decoder = JSONDecoder()
        if let path = Bundle.main.path(forResource: "\(filename)", ofType: "json") {
            do {
                 let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                 let jsonPetitions = try? decoder.decode(StatesModel.self, from: data)
                completion(true,"",jsonPetitions!)
                } catch {
            }
        }
    }
}
