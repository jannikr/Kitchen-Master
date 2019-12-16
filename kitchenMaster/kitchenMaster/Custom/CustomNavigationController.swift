//
//  CustomNavigationController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 15.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    //First loading function
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBarInvinsible()
        // Do any additional setup after loading the view.
    }
    
    //new Navigationbar Look
    func makeBarInvinsible(){
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }

}
