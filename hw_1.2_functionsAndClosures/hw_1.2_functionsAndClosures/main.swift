//
//  main.swift
//  hw_1.2_functionsAndClosures
//
//  Created by Ertuğrul Akkaya on 22.08.2025.
//

import Foundation

enum Islem {
    case toplame
    case cikarma
    case carpma
    case bolme
}


func hesapla(islem : Islem, sayi1 : Double, sayi2 : Double) -> Double?{
    
    switch islem {
        
    case .toplame:
        return (sayi1 + sayi2)
    case .cikarma:
        if sayi1 > sayi2 {
            return (sayi1 - sayi2)
        }else{
            return (sayi2 - sayi1)
        }
    case .carpma :
        return (sayi1 * sayi2)
        
    case .bolme :
        if sayi1 == 0 || sayi2 == 0 {
            return nil
        }else{
            return (sayi1 / sayi2)
        }
        
        
        
    }
    
}

let toplamSonuc = hesapla(islem: .toplame, sayi1: 1.2, sayi2: -1.6)
print(String(format: "Toplam Sonucu : %.2f ", toplamSonuc ?? 0 ))

let cikartmaSonuc = hesapla(islem: .cikarma, sayi1: 9.9, sayi2: 1.1)
print(String(format: "Cikarma Sonucu : %.2f ", cikartmaSonuc ?? 0 ))

let carpmaSonucu = hesapla(islem: .carpma, sayi1: -22, sayi2: -2.2)
print(String(format: "Carma Sonucu : %.2f ", carpmaSonucu ?? 0 ))

let bolmeSonucuHata = hesapla(islem: .bolme, sayi1: 0, sayi2: 1)
print(String(format: "Hatali Bolme Sonucu : %.2f ", bolmeSonucu ?? 0 ))

let bolmeSonucu = hesapla(islem: .bolme, sayi1: 1/3, sayi2: 4/5)
print(String(format: "Bolme Sonucu : %.2f ", bolmeSonucu ?? 0 ))



print("----------------------------------------------------------")


let dizi = [1,2,3,4,7,9,5,3,7,3,9,2,8,4,6,8,0,5,3]

let uceTamBolunenler = dizi.filter(
    
    {
        $0 % 3 == 0
    }
)

let besBoluIkiyeTamBolunenelr = dizi.filter(
    
    {
        $0 % 5/2 == 0
    }
)

let sirali = dizi.sorted(
    by: {
        (s1: Int, s2: Int) -> Bool in
        return s1 > s2
        
        
    }
)

print("Uc'e tam bolunenler : \(uceTamBolunenler)")

print("5/2'ye tam bolunenler : \(besBoluIkiyeTamBolunenelr)")

print("Sirali  : \(sirali)")







