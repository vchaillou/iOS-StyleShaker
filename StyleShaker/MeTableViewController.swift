//
//  MeTableViewController.swift
//  StyleShaker
//
//  Created by Etudiant on 07/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

class MeTableViewController: UIViewController, UITableViewDataSource{
    
    // Tableaux contenant les différents paramètres de Me
    var leftButtonText:Array<String> = ["Clairs", "Claire", "Male"]
    var rightButtonText:Array<String> = ["Foncés", "Foncée", "Femelle"]
    var cellTitleText:Array<String> = ["Cheuveux", "Peau", "Sexe"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.dataSource = self
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
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MeElementIdentifier", forIndexPath: indexPath) as! MeTableViewCell

        cell.setLeftButtonText(leftButtonText[indexPath.row])
        cell.setRightButtonText(rightButtonText[indexPath.row])
        cell.setCellTitleText(cellTitleText[indexPath.row])
        return cell
    }

    @IBAction func onValidate(sender: AnyObject) {
        // TODO => passer à la vue suivante
    }
}
