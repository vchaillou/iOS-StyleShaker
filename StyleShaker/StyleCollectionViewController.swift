//
//  StyleCollectionViewController.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

private let STYLE_CELL_ELEMENT_IDENTIFIER = "CollectionCell"

private let STYLE_VIEW_TITLE="Style"

private let STYLE_URL="http://163.172.27.134/api/products"

private let SEGUE_STYLE_TO_DETAIL="StyleToDetail"

class StyleCollectionViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collection: UICollectionView!
    internal var productList:Array<Product> = []
    private var nbShake = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collection.dataSource = self
        
        ParseUtil.parseJson(STYLE_URL, viewController: self)
        nbShake = 0;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // Passage en argument du produit de la cellule sélectionnée
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == SEGUE_STYLE_TO_DETAIL) {
            let controller: DetailProductViewController = segue.destinationViewController as! DetailProductViewController
            let cell=sender as! StyleCollectionViewCell
            
            controller.product = cell.product
        }
    }
    

    // MARK: - Collection View Data Source

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return productList.count < 10 ? productList.count : 10
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(STYLE_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! StyleCollectionViewCell
            
        cell.setCellTitleText("Produit \(indexPath.row + 1)")
        cell.product = productList[(indexPath.row + nbShake * 10)%productList.count]
        cell.setCellImage()
        return cell
    }
    
    // MARK: - Shake
    
    // Activation des Shakes
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    // Traitement du shake une fois qu'il est terminé
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            self.nbShake += 1
            collection.reloadData()
        }
    }

}
