//
//  MeTableViewController.swift
//  StyleShaker
//
//  Created by Etudiant on 07/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

private let ME_CELL_ELEMENT_IDENTIFIER="MeElementIdentifier"

private let SEGUE_ME_TO_MOOD="MeToMood"

class MeTableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ME_PREFERENCES.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ME_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! MeTableViewCell

        cell.setData(ME_PREFERENCES[indexPath.row])
        return cell
    }
}
