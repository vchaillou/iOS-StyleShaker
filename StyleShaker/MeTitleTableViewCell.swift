//
//  MeTitleTableViewCell.swift
//  StyleShaker
//
//  Created by Etudiant on 08/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class MeTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellCorpus: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    internal func setCellTitleText(text:String) {
        cellTitle.text = text
    }
    
    internal func setCellCorpusText(text:String) {
        cellCorpus.text = text
    }

}
