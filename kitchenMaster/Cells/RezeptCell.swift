//
//  RezeptCell.swift
//  kitchenMaster
//
//  Created by Jan Rückert on 18.12.19.
//  Copyright © 2019 Jan Rückert. All rights reserved.
//

import UIKit

class RezeptCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}