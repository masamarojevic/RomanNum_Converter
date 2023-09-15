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
        
        let romanNumber : [(String,Int)] = [("M",1000),("CM",900),("D",500),("CD",400),("C",100),("XC",90),("L",50),("XL",40),("X",10),("IX",9),("V",5),("IV",4),("I",1)]
        
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
        let romanValue : [String: Int] = ["I": 1,"IV":4 ,"V": 5, "IX": 9 ,"X": 10, "XL":40, "L": 50, "XC":90, "C": 100,"CD":400 ,"D":500, "CM": 900, "M":1000]
        
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
