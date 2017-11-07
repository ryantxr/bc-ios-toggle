//
//  SwitchTableViewCell.swift
//  Toggle
//
//  Created by ryan teixeira on 11/6/17.
//  Copyright © 2017 Blazecore. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var uiSwitch: UISwitch!
    @IBOutlet weak var label: UILabel!
    // Which row is this?
    var row : Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
