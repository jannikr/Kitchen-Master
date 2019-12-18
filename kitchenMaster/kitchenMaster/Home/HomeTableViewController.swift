//
//  HomeTableViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 16.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let rezeptCell = UINib.init(nibName: "RezeptCell", bundle: nil)
            self.tableView.register(rezeptCell, forCellReuseIdentifier: "RezeptCell")
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RezeptCell", for: indexPath) as! RezeptCell
            return cell
        }
    }
