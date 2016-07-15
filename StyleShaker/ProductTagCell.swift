//
//  ProductTag.swift
//  StyleShaker
//
//  Created by Etudiant on 15/07/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit


class ProductTagCell: UICollectionViewCell  {

    
    @IBOutlet weak var cellTagText: UILabel!
    
    
    internal func setCellTag(text:String) {
        cellTagText.text = text
    }


}