//
//  MeTableViewController.swift
//  StyleShaker
//
//  Created by Etudiant on 07/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

let ME_CELL_ELEMENT_IDENTIFIER="MeElementIdentifier"
let ME_CELL_TITLE_IDENTIFIER="MeTitleElementIdentifier"

let ME_VIEW_TITLE="Me"
let ME_VIEW_CORPUS="Décrivez votre propre couleur de cheuveux, votre couleur de peau et votre sexe"

let SEGUE_ME_TO_MOOD="MeToMood"

class MeTableViewController: UIViewController, UITableViewDataSource{
    
    // Tableaux contenant les différents paramètres de Me
    var cellData:Array<UserPreference> = [
            UserPreference(sTitle: "Cheuveux", sLeftValue: "Clairs", sRightValue: "Foncés", sPersistenceTag: "USER_DATA_PREFERENCE_HAIR"),
            UserPreference(sTitle: "Peau", sLeftValue: "Claire", sRightValue: "Foncée", sPersistenceTag: "USER_DATA_PREFERENCE_SKIN"),
            UserPreference(sTitle: "Sexe", sLeftValue: "Male", sRightValue: "Femelle", sPersistenceTag: "USER_DATA_PREFERENCE_GENDER")]

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
        return 2 // 1 => Description, 2 => cellules de choix
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 1 ? cellData.count : 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(ME_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! MeTableViewCell

            cell.setData(cellData[indexPath.row])
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(ME_CELL_TITLE_IDENTIFIER, forIndexPath: indexPath) as! TitleTableViewCell
            
            cell.setCellTitleText(ME_VIEW_TITLE)
            cell.setCellCorpusText(ME_VIEW_CORPUS)
            return cell
        }
    }
    
    @IBAction func onValidate(sender: UIButton) {
        self.performSegueWithIdentifier(SEGUE_ME_TO_MOOD, sender: self);
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller: MoodTableViewController = segue.destinationViewController as! MoodTableViewController;
        //controller.preferences
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
