//
//  Recepe.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 27.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import Foundation

struct Recepe {
    let name: String
    let category: String
    let person: Int
    let cookingTime: Int
    let instruction: String?
    let ingridiants: [String]?
    let timestamp: Double

    
//init-Methode mit Standardwerten
init(name: String,
     category: String,
     person: Int,
     cookingTime: Int,
     instruction: String? = nil,
     ingridiants: [String]? = nil,
     timestamp: Double? = nil){
    
        self.name = name
        self.category = category
        self.person = person
        self.cookingTime = cookingTime
        self.instruction = instruction
        self.ingridiants = ingridiants
        
        if let theTimestamp = timestamp {
            self.timestamp = theTimestamp
        }else {
            self.timestamp = Date().timeIntervalSince1970
        }
    }
    
}
