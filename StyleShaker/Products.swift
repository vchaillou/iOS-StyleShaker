//
//  Products.swift
//  JSONStreamer
//
//  Created by Etudiant on 28/06/2016.
//  Copyright © 2016 asapps. All rights reserved.
//

import Foundation



import UIKit

class Products: NSObject {
    
    
    var about: String
    var picture : String
    var thumbnail: String
    var title: String
    var skin: String
    var tags: Array<String>
    var criteria: [String:[String:Bool]]
    
    override init(){
        
        self.about = "unknown"
        self.picture = "unknown"
        self.thumbnail = "unknown"
        self.title = "unknown"
        self.skin = "unknown"
        self.tags = []
        self.criteria = [:]
    }
    
    convenience init(about: String, picture: String, thumbnail: String, title: String, skin: String,tags:Array<String>,
        criteria: [String:[String:Bool]]){
        self.init()
        
        self.about = about
        self.picture = picture
        self.thumbnail = thumbnail
        self.title = title
        self.skin = skin
        self.criteria = criteria
        self.tags = tags
 
    }
    
    
    
   
}
