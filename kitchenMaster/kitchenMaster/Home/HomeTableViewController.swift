//
//  HomeTableViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 16.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var recepes: [Recepe] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let CeasersSalad = Recepe(name: "Ceasers Salad", category: "Salat", person: 2, cookingTime: 20)
            recepes.append(CeasersSalad)
            
            let SpaghettiNapoli = Recepe(name: "Spaghetti Napoli", category: "Hauptspeise", person: 3, cookingTime: 30)
            recepes.append(SpaghettiNapoli)
            
            let PilzSuppe = Recepe(name: "Pilzsuppe", category: "Suppe", person: 2, cookingTime: 25)
            recepes.append(PilzSuppe)
            
            
            let rezeptCell = UINib.init(nibName: "RezeptCell", bundle: nil)
            self.tableView.register(rezeptCell, forCellReuseIdentifier: "RezeptCell")
            self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)  
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return recepes.count
        }
    
        //table-view-controller background
        override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = UIColor.clear
        }
        
        //cell-size
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 260
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RezeptCell", for: indexPath) as! RezeptCell
            
            //Configure the cell...
            let recipe = recepes[indexPath.row]
            cell.category.text = recipe.category!.uppercased()
            cell.name.text = recipe.name
            
            return cell
        }
    }
