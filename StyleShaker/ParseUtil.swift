//
//  ParseUtil.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class ParseUtil {
    
    
    static func parseJson(url:String) -> AnyObject? {
        let requestUrl: NSURL = NSURL(string: url)!
        let request : NSMutableURLRequest = NSMutableURLRequest(URL: requestUrl)
        let session = NSURLSession.sharedSession()
        var json:AnyObject? = nil
        
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
                    print("Ah bah non, la poule a trébuché...")
                }
            }
        }
        task.resume()
        
        return json
    }
    
    
    
}