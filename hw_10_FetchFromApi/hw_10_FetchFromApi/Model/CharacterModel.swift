//
//  CharacterModel.swift
//  hw_10_FetchFromApi
//
//  Created by Ertuğrul Akkaya on 20.09.2025.
//

import Foundation

struct Character : Identifiable, Codable{
    let  id : Int
    let  name : String
    let status : String
    let species : String
    let type : String
    let gender : String
    let  origin : Origin
    let location : Location
    let episode : [String]
    let url : String
    let created : String
    let  image : String
}









