//
//  Converter.swift
//  TenTechfingers_Uppgift1
//
//  Created by Ana Marojevic on 2023-09-14.
//

import Foundation

class Converter {
    
   
    //convert from arabic to roman , return a string
    
    func toRoman( arabicNumber: Int ) -> String{
        
        let romanNumber : [(String,Int)] = [("M",1000),("D",500),("C",100),("L",50),("X",10),("V",5),("I",1)]
        
        var number = arabicNumber
        var result = ""
        
        //cheking if the number corresponds the roman value and if it does it becomes the result. the number is then removed from the list of testing.
        for(romanNumb, value) in romanNumber{
            while number >= value {
                result += romanNumb
                number -= value
            }
        }
        return result
        
    }
    
    func toArabic ( romanNumber: String) -> Int {
        let romanValue : [String: Int] = ["I": 1, "V": 5, "X": 10,"L": 50, "C": 100, "D":500, "M":1000]
        
        var result = 0
       
       //cheking if the roman number correcponds the value and if it matches it becomes the result.
        for symbol in romanNumber {
            if let value
                = romanValue[String(symbol)]{
               result += value
            } else {
                return 0
            }
        }
        return result
    }
   
}
