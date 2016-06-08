//
//  MeTableViewController.swift
//  StyleShaker
//
//  Created by Etudiant on 07/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

let CELL_ELEMENT_IDENTIFIER="MeElementIdentifier"
let CELL_TITLE_IDENTIFIER="MeTitleElementIdentifier"

let VIEW_TITLE="Me"
let VIEW_CORPUS="Décrivez votre propre couleur de cheuveux, votre couleur de peau et votre sexe"

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
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 1 ? 3 : 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! MeTableViewCell

            cell.setLeftButtonText(leftButtonText[indexPath.row])
            cell.setRightButtonText(rightButtonText[indexPath.row])
            cell.setCellTitleText(cellTitleText[indexPath.row])
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier(CELL_TITLE_IDENTIFIER, forIndexPath: indexPath) as! MeTitleTableViewCell
            
            cell.setCellTitleText(VIEW_TITLE)
            cell.setCellCorpusText(VIEW_CORPUS)
            return cell
        }
    }

    @IBAction func onValidate(sender: AnyObject) {
        // TODO => passer à la vue suivante
    }
}
