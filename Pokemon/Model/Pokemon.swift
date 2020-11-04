//
//  Pokemon.swift
//  Pokemon
//
//  Created by Aaron Fulwider on 10/31/20.
//

import Foundation
import UIKit

struct Pokemon:Codable {
    var name:String?
    var abilities:[Ability]?
    var sprites:Sprite?
    var moves:[Move]?
    var types:[Type]?
}
struct Ability:Codable {
    var ability:NameURL?
}
struct Type:Codable {
    var type:NameURL?
}
struct Sprite:Codable{
    var back_default:String?
    var back_female:String?
    var back_shiny:String?
    var back_shiny_female:String?
    var front_default:String?
    var front_female:String?
    var front_shiny:String?
    var front_shiny_female:String?
}
struct Move:Codable{
    var move:NameURL?
}

struct NameURL:Codable {
    var name:String?
    var url:String?
}

struct PokePagination:Codable {
    var previous:String?
    var next:String?
    var results:[NameURL?]
}
