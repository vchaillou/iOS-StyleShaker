//
//  StyleCollectionViewController.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

private let STYLE_CELL_ELEMENT_IDENTIFIER = "CollectionCell"
private let STYLE_CELL_TITLE_IDENTIFIER = "CollectionCellTitle"

private let STYLE_VIEW_TITLE="Style"

private let STYLE_URL="http://163.172.27.134/api/products"

class StyleCollectionViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    var productList:Array<Product>
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        collection.dataSource = self
        
        for item in ParseUtil.parseJson(STYLE_URL) as! [[String:AnyObject]] {
            var criteres = item["Criteria"]
            var valid=true;
            for critere in criteres as! [String:AnyObject] {
                if critere.0 == "Mood" {
                    for mood in critere as! [String:Bool] {
                        for myMood in DataPersistence.getInstance().getUserPreferences() {
                            if mood.0 == myMood.title {
                                if mood.1 != myMood.isEnabled() {
                                    valid = false
                                }
                            }
                            else {
                                // C'est un me -> checker si le me correspond au me sauvegardé
                            }
                        }
                    }
                }
                else {
                    if critere
                }
            }
            
            if (valid==true){
                productList.add() // ajouter les valeurs dans la liste
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 8
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(STYLE_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! StyleCollectionViewCell
            
        cell.setCellTitleText("Dummy product")
        cell.setCellImage(/* TODO */)
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
