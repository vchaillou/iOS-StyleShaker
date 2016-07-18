//
//  StyleCollectionViewCell.swift
//  StyleShaker
//
//  Created by Etudiant on 13/07/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class StyleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    internal var product:Product?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    internal func setCellTitleText(text:String) {
        cellTitle.text = text
    }
    
    internal func setCellImage() {
        let url = NSURL(string : product!.urlImage);
        
        let data = NSData(contentsOfURL: url!)
        
        if data != nil {
            cellImage.image = UIImage(data:data!)
        }
    }
    
}