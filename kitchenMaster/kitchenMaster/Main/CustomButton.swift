//
//  CustomButton.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 10.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    //First loading function
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //First required loading function
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSetup()
    }
    
    //Main Button e.g. ANMELDEN
    func defaultSetup(){
        
        layer.cornerRadius = layer.frame.height/2
        
    }
    
    //Secondary Button e.g. REGISTRIEREN
    func secondaryButton(){
        
    }
    
}
