//
//  MoodTableViewController.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 07/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

private let MOOD_CELL_ELEMENT_IDENTIFIER="MoodElementIdentifier"

private let SEGUE_MOOD_TO_STYLE="MoodToStyle"

class MoodTableViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MOOD_PREFERENCES.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MOOD_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! MoodTableViewCell
            
        cell.setData(MOOD_PREFERENCES[indexPath.row])
        return cell
    }

}
