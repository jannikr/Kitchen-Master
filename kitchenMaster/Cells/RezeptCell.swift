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
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
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
