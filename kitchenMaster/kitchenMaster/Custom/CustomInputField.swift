//
//  CustomInputField.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 08.01.20.
//  Copyright © 2020 Jan Rückert. All rights reserved.
//

import Foundation
import UIKit

class CustomInputField {
    
    static func styleInputField(_ inputfield: UITextField){
        
        //Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: inputfield.frame.height - 2, width: inputfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 246/255, green: 153/255, blue: 87/255, alpha: 1).cgColor
        
        //Remove border on the input field
        inputfield.borderStyle = .none
        
        //Add the line to the textfield
        inputfield.layer.addSublayer(bottomLine)
        
    }
    
}
