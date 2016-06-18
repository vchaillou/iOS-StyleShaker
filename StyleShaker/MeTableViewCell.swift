//
//  MeTableViewCell.swift
//  StyleShaker
//
//  Created by Etudiant on 08/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class MeTableViewCell: UITableViewCell {

    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var cellTitle: UILabel!

    @IBOutlet weak var title: UILabel!
    var userPreference:UserPreference!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        onClick(leftButton)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setData(preference:UserPreference) {
        userPreference = preference
        leftButton.setTitle(userPreference.leftValue, forState: .Normal)
        rightButton.setTitle(userPreference.rightValue, forState: .Normal)
        cellTitle.text = userPreference.title
        cellSwitch.setOn(userPreference.isEnabled(), animated: false)
        updateCell()
    }

    @IBAction func onSwitch(sender: AnyObject) {
        userPreference.setEnabled(cellSwitch.on)
        updateCell()
    }
    
    @IBAction func onClick(sender: UIButton) {
        guard userPreference != nil else {
            return
        }
        userPreference.setRightSelected(Bool(sender.tag))
        if userPreference.isRightSelected() {
            rightButton.backgroundColor = UIColor.greenColor()
            leftButton.backgroundColor = nil
        }
        else {
            leftButton.backgroundColor = UIColor.greenColor()
            rightButton.backgroundColor = nil
        }
    }
    
    private func updateCell() {
        leftButton.enabled = userPreference.isEnabled()
        rightButton.enabled = userPreference.isEnabled()
        
        if userPreference.isEnabled() {
            onClick(userPreference.isRightSelected() ? rightButton : leftButton)
        }
        else {
            leftButton.backgroundColor = nil
            rightButton.backgroundColor = nil
        }
    }
}
