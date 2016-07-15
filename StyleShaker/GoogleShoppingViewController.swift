//
//  GoogleShoppingViewController.swift
//  StyleShaker
//
//  Created by Etudiant on 15/07/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit



class GoogleShoppingViewController: UIViewController  {

    
    internal var champs : String?
    @IBOutlet weak var webView: UIWebView!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        if(champs == nil){
            
            print("coucou toi, ça ne va pas")
            
        }
       webView.loadRequest(NSURLRequest(URL: NSURL(string : "https://www.google.fr/#tbm=shop&q=" + (champs?.stringByReplacingOccurrencesOfString(" ", withString: "+"))! )!))
      
    }
    
    
    
}