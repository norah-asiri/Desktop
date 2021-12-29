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
