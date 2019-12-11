//
//  CustomTextField.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 11.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    //First loading function
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultSetup()
    }
    
    //First required function
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultSetup()
    }
    
    //Setup TextField
    func defaultSetup(){
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
        
    }
    
}
