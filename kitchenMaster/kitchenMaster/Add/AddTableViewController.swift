//
//  AddTableViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 16.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var categoryTextfield: UITextField!
    @IBOutlet weak var numberTextfield: UITextField!
    @IBOutlet weak var cookingtimeTextfield: UITextField!
    @IBOutlet weak var ingridiants: UITextField!
    @IBOutlet weak var instructions: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: Any) {
        
        if let name = nameTextfield.text {
            let person = Int(numberTextfield.text!)
            let cookingTime = Int(cookingtimeTextfield.text!)
            let recepe = Recepe(name: name, category: categoryTextfield.text!, person: person, cookingTime: cookingTime, instruction: instructions.text!, ingridiants: Recepe.WhiteSpaceSplitter(indgridiantsString: ingridiants.text!))
            print(":-) Rezept Neu: \(recepe)")
            let plistDictionary = recepe.plistDictionary()
            print(":-) plistDicionary: \(plistDictionary)")
            
            /*
             Save Dictionary in an Array and send it to the Filesystem (local)
             Code-Quelle: Apps programmieren mit Swift von Rheinwerk Computing
            */
            
            //let plistArray = [plistDictionary]
            
            if let url = Recepe.recepesURL() {
                let plist: Any?
                if let inData = try? Data(contentsOf: url){
                    plist = try? PropertyListSerialization.propertyList(from: inData, options: [], format: nil)
                } else {
                    plist = nil
                }
                
                do {
                    var plistArray: [[String:Any]] = []
                    if let theArray = plist as? [[String:Any]] {
                        plistArray = theArray
                    }
                    
                    plistArray.append(plistDictionary)
                    
                    let data = try PropertyListSerialization.data(fromPropertyList: plistArray, format: .xml, options: 0)
                    
                    try data.write(to: url, options: .atomic)
                    
                    self.transitionToHome()
                    
                    //dismiss(animated: true, completion: nil)
                    
                } catch {
                    print(":-) error: \(error)")
                }
            } else{
                print(":-) Fehler im Dateisystem")
            }
        }
        
    }
    
    func transitionToHome() {
        
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TabBar")
        self.present(controller, animated: true, completion: nil)
        
    }
        
}


