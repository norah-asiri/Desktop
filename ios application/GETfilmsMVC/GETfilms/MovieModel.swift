//
//  MovieModel.swift
//  GETfilms
//
//  Created by admin on 29/12/2021.
//

import Foundation
struct Movie : Codable {
    let count : Int?? = 0
    let results : [Result]

}

struct Result : Codable {
    let title: String?
    let release_date: String?? = "Nothing"
    let characters : [String]
    
    enum CodingKeys: String, CodingKey {
        case title
        case release_date = "birth_year"
        case characters
    }
}
