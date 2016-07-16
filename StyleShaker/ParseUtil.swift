//
//  ParseUtil.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class ParseUtil {
    
    
    
    static func filterJson(data: NSData,viewController:StyleCollectionViewController) -> Void {
        var json:AnyObject? = nil
        
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
        }
        catch {
            print("Erreur lors du parsing")
        }
        
        
        for item in json as! [[String:AnyObject]] {
            let criteres = item["criteria"]
            var valid=false;
            for critere in criteres as! [String:AnyObject] {
                if critere.0 == "mood" {
                    for mood in critere.1 as! [String:Bool] {
                        for myMood in MOOD_PREFERENCES {
                            if mood.0 == myMood.key && mood.1 && myMood.isEnabled() {
                                valid = true
                                break;
                            }
                        }
                    }
                }
            }
            if(valid) {
                for critere in criteres as! [String:AnyObject] {
                    for myMe in ME_PREFERENCES {
                        if critere.0 == myMe.key && myMe.isEnabled() && valid {
                            valid = false
                            let rightLeft = Array((critere.1 as! [String:Bool]).values)
                            if (rightLeft[0] && myMe.isRightSelected()) || (rightLeft[1] && !myMe.isRightSelected()) {
                                valid = true
                            }
                        }
                    }
                }
            }
            
            if (valid){
                viewController.productList.append(Product(title: item["title"] as! String, urlImage: item["picture"] as! String, tags: item["tags"] as! Array<String>, descriptionProduct: item["about"] as! String))
            }
        }
    
        dispatch_async(dispatch_get_main_queue(), {
            viewController.collection.reloadData()
        })
    
    }
    
    static func parseJson(url:String, viewController:StyleCollectionViewController) -> Void {
        
        let requestUrl: NSURL = NSURL(string: url)!
        let request : NSMutableURLRequest = NSMutableURLRequest(URL: requestUrl)
        let session = NSURLSession.sharedSession()
        //let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        var connexionOk=false
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if (Network.isConnectedToNetwork()) {
                let httpResponse = response as! NSHTTPURLResponse
                let statusCode = httpResponse.statusCode
                if (statusCode == 200) {
                    connexionOk=true
                }
                
            }
            
            /**** Avec Connexion Internet **/
            if (connexionOk == true) {
                print("Sisi t'as une connexion internet")
                let userDefaults = NSUserDefaults.standardUserDefaults()
                userDefaults.setObject(data, forKey: "products")
                filterJson(data!, viewController: viewController)
                
            }
            /**** Mode Hors ligne **/
            else {
                
                print("Abonne toi à la Freeebox Mgueul")
                let userDefaults = NSUserDefaults.standardUserDefaults()
                
                let dataOffline = userDefaults.objectForKey("products")! as! NSData
                filterJson(dataOffline, viewController: viewController)
                
            
            }
        }
        
        task.resume()
    }
    
    
    
}