//
//  main.swift
//  hw_1.1_variablesAndDataTypes
//
//  Created by Ertuğrul Akkaya on 22.08.2025.
//

import Foundation

let  name : String = "Ertuğrul"
let  surname : String = "Akkaya"
let  age : Int = 25
let  isStudent : Bool = false
let  height : Double = 1.72

func printPersonelCard(name : String, surname : String,age : Int, isStudent : Bool?, height: Double){
    
    print("Ad : \(name) ")
    
    print ("Soyad : \(surname) ")
    
    print( "Yaş : \(age) ")
    
    if let isStudent = isStudent{
        print("Öğrenci mi? : \(isStudent) ")
    }else{
        print("Öğrenci bilgisi bulunamadı")
    }
    
    print("Boy : \(height)")
        
    
}


    printPersonelCard(
        name: name,
        surname: surname,
        age: age,
        isStudent: isStudent,
        height: height
    )


print("---------------------------------------")
print("opsiyonel parametreyi nil göndererek ->")


printPersonelCard(
    name: name,
    surname: surname,
    age: age,
    isStudent: nil,
    height: height
)







