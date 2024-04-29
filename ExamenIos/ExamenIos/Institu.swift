//
//  Institu.swift
//  ExamenIos
//
//  Created by ESPRIT on 1/3/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import Foundation


class Institu {
    var nom:String?
    var diplome:String?
    var score:Float?
    var image:String?
    var gouvernorat:String?

    init(nom:String,diplome:String,score:Float,image:String,gouvernorat:String)
    {
        self.nom=nom
        self.diplome = diplome
        
        self.score=score
        self.image=image
         self.gouvernorat=gouvernorat
        
    }
    
    
    
}
