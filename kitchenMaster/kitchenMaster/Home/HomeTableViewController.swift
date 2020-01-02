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
    var searchedRecepes: [Recepe] = []
    var searching = false
    
    let searchBar = UISearchBar()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recepes.removeAll()
        configureSearchBar()
        
        //Beispiel Rezept schon in der App
        let CeasersSalad = Recepe(name: "Ceasers Salad", category: "Salat", person: 2, cookingTime: 20)
        recepes.append(CeasersSalad)
        
        //Celll Style
        let rezeptCell = UINib.init(nibName: "RezeptCell", bundle: nil)
        self.tableView.register(rezeptCell, forCellReuseIdentifier: "RezeptCell")
        
        //Background Style
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        
        
        //getting data from local storage
        do {
            if let url = Recepe.recepesURL(){
                let data = try Data(contentsOf: url)
                let plist = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
                if let array = plist as? [[String:Any]] {
                    for dictionary in array {
                        let recepe = Recepe(dictionary: dictionary)
                        recepes.append(recepe)
                    }
                    tableView.reloadData()
                }
            } else {
                print(":-) Fehler im Dateisystem.")
            }
        } catch {
            print(":-) error: \(error)")
        }
    }
    

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if (searching) {
                return searchedRecepes.count
            } else {
                return recepes.count
            }
        }
    
        //table-view-controller background
        override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = UIColor.clear
        }
        
        //cell-size
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 260
        }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if (searching){
                let recipe = searchedRecepes[indexPath.row]
                let recipeDVC = DetailViewController()
                recipeDVC.modalPresentationStyle = .fullScreen
                recipeDVC.recepe = recipe
                self.present(recipeDVC, animated: true)
                
            }else{
                let recipe = recepes[indexPath.row]
                let recipeDVC = DetailViewController()
                recipeDVC.modalPresentationStyle = .fullScreen
                recipeDVC.recepe = recipe
                self.present(recipeDVC, animated: true)
            }
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "RezeptCell", for: indexPath) as! RezeptCell
            
            //Configure the cell...
            
            if (searching){
                let recipe = searchedRecepes[indexPath.row]
                cell.category.text = recipe.category!.uppercased()
                cell.name.text = recipe.name
            } else {
                let recipe = recepes[indexPath.row]
                cell.category.text = recipe.category!.uppercased()
                cell.name.text = recipe.name
                
            }
            return cell
        }
    
    
    //configs for search bar
    func configureSearchBar() {
        //Delegate Textfiled
        searchBar.delegate = self
        //Size Textfiled
        searchBar.sizeToFit()
        //Search options
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Namen", "Zutaten", "Kategorie"]
        searchBar.selectedScopeButtonIndex = 1
        //Show Buttons
        showSearchButtons(shouldShow: true)
        
        
    }

    func showSearchButtons(shouldShow: Bool) {
        if shouldShow {
                    
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                    barButtonSystemItem: .search,
                    target: self,
                    action: #selector(HomeTableViewController.searchBar(_:)))
        }else{
            navigationItem.rightBarButtonItem = nil
            navigationItem.leftBarButtonItem = nil
        }
    }
    
    func search(shouldShow: Bool){
        showSearchButtons(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    //action on search icon
    @IBAction func searchBar(_ sender: Any) {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
    
    
    
}

extension HomeTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("End Editing")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        switch searchBar.selectedScopeButtonIndex {
        case 0:
            searchedRecepes = recepes.filter({$0.name.prefix(searchText.count) == searchText})
        case 1:
            //Hier müssen Ingridiants stehen
            searchedRecepes = recepes.filter({$0.name.prefix(searchText.count) == searchText})
        default:
            //achtung! hier kann fehler kommen, wenn optional Category nicht gesetzt ist.
            searchedRecepes = recepes.filter({$0.category!.prefix(searchText.count) == searchText})
        }
        searching = true
        tableView.reloadData()
    }
}
