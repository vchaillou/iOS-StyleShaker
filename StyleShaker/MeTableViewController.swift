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
    
    // Tableaux contenant les différents paramètres de Me
    var cellData:Array<UserPreference> = [
            UserPreference(sTitle: "Cheuveux", sLeftValue: "Clairs", sRightValue: "Foncés", sPersistenceTag: "USER_DATA_PREFERENCE_HAIR"),
            UserPreference(sTitle: "Peau", sLeftValue: "Claire", sRightValue: "Foncée", sPersistenceTag: "USER_DATA_PREFERENCE_SKIN"),
            UserPreference(sTitle: "Sexe", sLeftValue: "Male", sRightValue: "Femelle", sPersistenceTag: "USER_DATA_PREFERENCE_GENDER"),
            UserPreference(sTitle: "prout", sLeftValue: "fnhdjskf", sRightValue: "fhdjskf", sPersistenceTag: "USER_DATA_PREFERENCE_TEST")]

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
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cellData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ME_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! MeTableViewCell

        cell.setData(cellData[indexPath.row])
        return cell
    }
}
