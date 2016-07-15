//
//  DetailProductViewController.swift
//  StyleShaker
//
//  Created by Etudiant on 15/07/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit


private let DETAIL_CELL_ELEMENT_IDENTIFIER = "CollectionCell"
private let SEGUE_DETAIL_TO_SHOPPING="DetailToShopping"

class DetailProductViewController: UIViewController,UICollectionViewDataSource  {


    
    
    @IBOutlet weak var titleProduct: UILabel!

    @IBOutlet weak var descriptionProduct: UITextView!
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var tagProduct: UICollectionView!
    
    
    internal var product:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleProduct.text = product!.title
        descriptionProduct.text = product!.descriptionProduct
        tagProduct.dataSource = self
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == SEGUE_DETAIL_TO_SHOPPING) {
            
            let controller: GoogleShoppingViewController = segue.destinationViewController as! GoogleShoppingViewController
             controller.champs = product?.title
            
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let url = NSURL(string : product!.urlImage);
        
        let data = NSData(contentsOfURL: url!)
        
        if data != nil {
            imgProduct.image = UIImage(data:data!)
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return (product?.tags.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DETAIL_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! ProductTagCell
        
       
        
        
        cell.setCellTag((product?.tags[indexPath.row])!)
        
        return cell
    }
    
    
    
    
}