//
//  MoodTableViewController.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 07/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

let MOOD_CELL_ELEMENT_IDENTIFIER="MoodElementIdentifier"
let MOOD_CELL_TITLE_IDENTIFIER="MoodTitleElementIdentifier"

let MOOD_VIEW_TITLE="Mood"
let MOOD_VIEW_CORPUS="Décrivez votre mood"

let SEGUE_MOOD_TO_NEXT="MoodToNext"

class MoodTableViewController: UIViewController,UITableViewDataSource {
    
    
    // Tableaux contenant les différents paramètres de Mood
    var cellData:Array<UserPreference> = [
        UserPreference(sTitle: "Travail", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_WORK"),
        UserPreference(sTitle: "Soiree", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_NIGHT"),
        UserPreference(sTitle: "Weekend", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_WEEKEND"),
        UserPreference(sTitle: "Chill", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_CHILL")]
    
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
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 1 ? cellData.count : 1
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(MOOD_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! MoodTableViewCell
            
            cell.setData(cellData[indexPath.row])
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(MOOD_CELL_TITLE_IDENTIFIER, forIndexPath: indexPath) as! TitleTableViewCell
            
            cell.setCellTitleText(MOOD_VIEW_TITLE)
            cell.setCellCorpusText(MOOD_VIEW_CORPUS)
            return cell
        }
    }

}
