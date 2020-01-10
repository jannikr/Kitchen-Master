//
//  DetailViewController.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 02.01.20.
//  Copyright © 2020 Jan Rückert. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var rezeptName: UILabel!
    @IBOutlet weak var rezeptKategorie: UILabel!
    @IBOutlet weak var rezeptZutaten: UILabel!
    @IBOutlet weak var rezeptAnleitung: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var recepe: Recepe? = nil

    //Insert Data
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //more lines for instructions
        rezeptAnleitung.numberOfLines = 0
        rezeptAnleitung.frame = CGRect(x: 20.0, y: 500.0, width: 374.0 , height: 100.0)
        
        rezeptZutaten.numberOfLines = 0
        rezeptZutaten.frame = CGRect(x: 20.0, y: 350.0, width: 374.0 , height: 100.0)
        print(recepe!)
        rezeptName.text = recepe?.name
        rezeptKategorie.text = recepe?.category?.uppercased()
        rezeptZutaten.text = (recepe?.ingridiants)?.joined(separator: "-")
        //funktionier noch nicht
        rezeptAnleitung.text = recepe?.instruction
        if (recepe?.imageName != nil){
            imageView.image = UIImage(named: (recepe?.imageName)!)
        } else {
            imageView.image = UIImage(named: "salad")
        }
    }
    //Share Button
    
    @IBAction func share(_ sender: Any) {
        
        guard let theRecipe = recepe else { return }
        
        var items: [Any] = ["Dieses Rezept kann ich dir empfehlen: \(theRecipe.name). Installiere jetzt Kitchen Master!"]
        
        if let image = imageView.image {
            items.append(image)
        }
        
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
        
    }
}
