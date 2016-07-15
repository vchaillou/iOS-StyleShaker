//
//  ParseUtil.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class ParseUtil {
    
    
    static func parseJson(url:String, viewController:StyleCollectionViewController) -> Void {
        var json:AnyObject? = nil
        let requestUrl: NSURL = NSURL(string: url)!
        let request : NSMutableURLRequest = NSMutableURLRequest(URL: requestUrl)
        let session = NSURLSession.sharedSession()
        //let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Ca roule ma poule !")
                do {
                    json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
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
        }
        
        task.resume()
    }
    
    
    
}