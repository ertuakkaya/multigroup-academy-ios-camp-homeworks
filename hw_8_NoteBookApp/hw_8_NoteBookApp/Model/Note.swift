//
//  Note.swift
//  hw_8_NoteBookApp
//
//  Created by Ertuğrul Akkaya on 13.09.2025.
//

import Foundation

struct Note : Identifiable, Codable{
   let  id : UUID
   var title : String
    var content : String
    let date: Date
}
