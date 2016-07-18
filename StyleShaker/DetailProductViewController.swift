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
    
    internal var product:Product? // Mis à jour par le segue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleProduct.text = product!.title
        descriptionProduct.text = product!.descriptionProduct
        tagProduct.dataSource = self
        
    }
    
    // On diffère l'affichage de l'image
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let url = NSURL(string : product!.urlImage);
        
        let data = NSData(contentsOfURL: url!)
        
        if data != nil {
            imgProduct.image = UIImage(data:data!)
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Seulement pour le segue qui mène à la vue Shopping
        // Pas pour celui qui mène aux informations
        if (segue.identifier == SEGUE_DETAIL_TO_SHOPPING) {
            
            let controller: GoogleShoppingViewController = segue.destinationViewController as! GoogleShoppingViewController
            controller.champs = product?.title
            
            
        }
    }
    
    // MARK: - Collection view data source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (product?.tags.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(DETAIL_CELL_ELEMENT_IDENTIFIER, forIndexPath: indexPath) as! ProductTagCell
        
        cell.setCellTag((product?.tags[indexPath.row])!)
        
        return cell
    }
    
    
    
    
}