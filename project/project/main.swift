//
//  main.swift
//  iOS dev
//
//  Created by aida madraimova on 09.09.2024.
//

import Foundation

print("Hello, World!")

var name = "Aida"
var surname = "Madraimova"

var birthyear = 2002
let currentyear: Int = 2024
var isstudent: Bool = true
var studentstatus: String = isstudent ? "I am currently a student." : "I am not a student."
var height: Double = 1.64
var age: Int = 21

age = currentyear - birthyear

var hobby = "Reading"
var numberofhobbies: Int = 2
var favoritenumber: Int = 22
var ishobbycreative: Bool = false
var hobbycreativeness: String = ishobbycreative ? "a creative" : "not a creative"
var lifestory: String = "My name is \(name) \(surname). I am \(age) years old, born in \(birthyear). \(studentstatus) I enjoy \(hobby), which is \(hobbycreativeness) hobby. I have \(numberofhobbies) in total, and my favorite number is \(favoritenumber)."
print(lifestory)

//bonus task
var futureGoals:String = "In the future i want to become a professional software engineer."
lifestory += futureGoals
print(lifestory)

