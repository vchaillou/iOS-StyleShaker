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
    var isRightSelected:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        onClick(leftButton)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setLeftButtonText(text:String) {
        leftButton.setTitle(text, forState: .Normal)
    }
    
    internal func setRightButtonText(text:String) {
        rightButton.setTitle(text, forState: .Normal)
    }
    
    internal func setCellTitleText(text:String) {
        cellTitle.text = text
    }

    @IBAction func onSwitch(sender: AnyObject) {
        leftButton.enabled = !leftButton.enabled
        rightButton.enabled = !rightButton.enabled
        
        if !leftButton.enabled {
            leftButton.backgroundColor = nil
            rightButton.backgroundColor = nil
        }
        else {
            onClick(isRightSelected ? rightButton : leftButton)
        }
    }
    
    @IBAction func onClick(sender: UIButton) {
        isRightSelected = Bool(sender.tag)
        if isRightSelected {
            rightButton.backgroundColor = UIColor.greenColor()
            leftButton.backgroundColor = nil
        }
        else {
            leftButton.backgroundColor = UIColor.greenColor()
            rightButton.backgroundColor = nil
        }
    }
}
