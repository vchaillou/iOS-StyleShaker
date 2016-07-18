//
//  Product.swift
//  StyleShaker
//
//  Created by Etudiant on 13/07/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

// Représentation d'un produit indépendante de la vue
class Product:NSObject {
    
    
    internal var title: String
    internal var urlImage: String
    internal var tags: Array<String>
    internal var descriptionProduct: String
    
    
    init(title: String, urlImage: String, tags: Array<String>, descriptionProduct: String) {
        self.title = title
        self.urlImage = urlImage
        self.tags = tags
        self.descriptionProduct = descriptionProduct
    }
    
    
    
    
    
    
    
    
}
