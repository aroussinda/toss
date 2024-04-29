//
//  Annonce.swift
//  FishingCornerIOS
//
//  Created by malek belayeb on 19/6/2021.
//

import Foundation



class Annonce:Codable {
    
    var idannonce:Int?
    var title:String?
    var price:String?
    var adress: String?
    var image:String?
    var description:String?
    var created_at:String?
    var user:User?
}
