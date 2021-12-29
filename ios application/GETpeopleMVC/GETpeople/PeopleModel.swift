//
//  PeopleModel.swift
//  GETpeople
//
//  Created by admin on 22/12/2021.
//

import Foundation

struct People : Codable {
    let count : Int
    let results : [Result]
    
//    init?(dict:[String:Any]) {
//        guard let name = dict["name"] as? String,  // Important
//              let birthYear = dict["birth_year"] as? String,
//              let films = dict["films"] as? [String],
//              let species = dict["species"] as? [String] else {
//                  print("parsing failed")
//                  return nil
//              }
//
//        self.name = name
//        self.birthYear = birthYear
//        self.films = films
//        self.species = species
//    }
}

struct Result : Codable {
    let name: String
    let birthYear: String
    let films : [String]
    let species : [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case films
        case species
    }
}
