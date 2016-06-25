//
//  MoodTableViewCell.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var cellTitle: UILabel!
    
    var userPreference:UserPreference!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    internal func setData(preference:UserPreference) {
        userPreference = preference
        cellTitle.text = userPreference.title
        cellSwitch.setOn(userPreference.isEnabled(), animated: false)
    }
    
    @IBAction func onSwitch(sender: AnyObject) {
        userPreference.setEnabled(cellSwitch.on)
    }
}

