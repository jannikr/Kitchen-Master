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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func save(_ sender: Any) {
        
        if let name = nameTextfield.text {
            let person = Int(numberTextfield.text!)
            let cookingTime = Int(cookingtimeTextfield.text!)
            let recepe = Recepe(name: name, category: categoryTextfield.text!, person: person, cookingTime: cookingTime)
            print(":-) Rezept: \(recepe)")
            let plistDictionary = recepe.plistDictionary()
            print(":-) plistDicionary: \(plistDictionary)")
            
            /*
             Save Dictionary in an Array and send it to the Filesystem (local)
             Code-Quelle: Apps programmieren mit Swift von Rheinwerk Computing
            */
            
            let plistArray = [plistDictionary]
            do {
                let data = try PropertyListSerialization.data(fromPropertyList: plistDictionary, format: .xml, options: 0)
                
                let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                
                if let documentURL = fileURLs.first {
                    let url = documentURL.appendingPathComponent("recepes.plist")
                    try data.write(to: url, options: .atomic)
                    
                    dismiss(animated: true, completion: nil)
                } else {
                    print(":-) Fehler im Dateisystem.")
                }
            } catch {
                    print(":-) error: \(error)")
                }
            }
        }
        
    }
    

    // MARK: - Table view data source
// Only for dynamic cell structure
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */


