//
//  ProductsViewController.swift
//  JSONStreamer
//
//  Created by Etudiant on 28/06/2016.
//  Copyright © 2016 asapps. All rights reserved.
//



import UIKit

let API_PROJECT: NSURL = NSURL(string: "http://163.172.27.134/api/products")!

class ProductsViewController: UIViewController, UITableViewDelegate/*, UITableViewDataSource*/ {
    
    @IBOutlet weak var tableView: UITableView!
    //var posts: [Post] = [];
    
    override func viewDidLoad() {/*
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "PostTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "PostCell")
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(API_PROJECT) { (data, response, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                for item in json as! [[String: AnyObject]] {
                    
                    let post: Post = Post(about: item["about"] as! String,
                        picture: item["picture"] as! String,
                        thumbnail: item["thumbnail"] as! String,
                        title: item["title"] as! String,
                        skin: item["skin"] as! String,
                        tags: item["tags"] as! Array<String>,
                        
                        for item2 in item["tags"] as [[String: AnyObject]] {
                        
                        
                        }
                    
                    
                    /*
                    var id: Int
                    var userId: Int
                    var title: String
                    var body: String

                    
                    var about: String
                    var picture : String
                    var thumbnail: String
                    var title: String
                    var skin: String
                    
                    var tags: Array<String>
                    var criteria: [String:[String:Bool]]
*/
                    
                    self.posts.append(post);
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
                
            }
            catch {
                print("Error during serialization");
            }
        }
        
        task.resume()*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITableview Datasource
    /*func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count;
    }*/
    /*
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostTableViewCell
        let post: Post = self.posts[indexPath.row];
        
        cell.lblId.text = "\(post.id)"
        cell.lblTitle.text = post.title
        
        return cell
    }*/
    
    // MARK: - UITableview Delegate
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ToDetail", sender: self.posts[indexPath.row]);
    }*/
    
    
    // MARK: - Navigation
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller: PostViewController = segue.destinationViewController as! PostViewController
        controller.post = sender as? Post
    }*/
}