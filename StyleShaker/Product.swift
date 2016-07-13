//
//  Product.swift
//  StyleShaker
//
//  Created by Etudiant on 13/07/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit


class Product:NSObject {
    
    
    var title : String
    var urlImage : String
    var longTitle : String
    var tag : Array<String>
    var descriptionProduct : String
    
    
    override init() {
        super.init()
    }
    
    
    
    convenience init(title: String,urlImage : String, longTitle : String, tag : Array<String>, descriptionProduct : String) {
        self.title = title
        self.urlImage = urlImage
        self.longTitle = longTitle
        self.tag = tag
        self.descriptionProduct = descriptionProduct
        
    }
    
    
    
    
    
    
    
}
