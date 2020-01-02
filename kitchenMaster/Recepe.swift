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
    let category: String?
    let person: Int?
    let cookingTime: Int?
    let instruction: String?
    let ingridiants: [String]?
    let timestamp: Double

    
//init-Methode mit Standardwerten
init(name: String,
     category: String? = nil,
     person: Int? = nil,
     cookingTime: Int? = nil,
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
    
//init-Methode um aus einem Dictionary ein Rezept-Objekt zu erstellen
    init(dictionary: [String:Any]) {
        name = dictionary["name"] as! String
        category = dictionary["category"] as? String
        person = dictionary["person"] as? Int
        cookingTime = dictionary["time"] as? Int
        instruction = dictionary["instruction"] as? String
        ingridiants = dictionary["ingridiants"] as? [String]
        timestamp = dictionary["timestamp"] as! Double
    }
    
    //Dictionary (Property List) zum Speichern von Rezepten
    func plistDictionary() -> [String:Any] {
        var theDictionary: [String:Any] = [:]
        theDictionary["name"] = name
        theDictionary["timestamp"] = timestamp
        
        if let theCategory = category {
            theDictionary["category"] = theCategory
        }
        
        if let thePerson = person {
            theDictionary["person"] = thePerson
        }
        
        if let theCookingTime = cookingTime {
            theDictionary["time"] = theCookingTime
        }
        
        if let theInstruction = instruction {
            theDictionary["istruction"] = theInstruction
        }
        
        if let theIngridiants = ingridiants {
            theDictionary["ingridiants"] = theIngridiants
        }
        
        return theDictionary
    }
    
    //ermittelt den Dateipfad für die Plist-Datei
    static func recepesURL() -> URL? {
        let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let documentURL = fileURLs.first {
            return documentURL.appendingPathComponent("recepes.plist")
        }
        return nil
    }
    
    static func WhiteSpaceSplitter(indgridiantsString: String) -> Array<String> {
        return indgridiantsString.components(separatedBy: " ")
    }
    
}
