//
//  personTVCell.swift
//  warmupDisplayPerson
//
//  Created by Alexander George Legaspi on 8/15/19.
//  Copyright © 2019 Alexander George Legaspi. All rights reserved.
//

import UIKit

class PersonTVCell: UITableViewCell {

    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
