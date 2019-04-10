//
//  ContactCell.swift
//  303 Software iOS Code Test
//
//  Created by Hasan, Adit on 4/10/19.
//  Copyright © 2019 Hasan, Adit. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
