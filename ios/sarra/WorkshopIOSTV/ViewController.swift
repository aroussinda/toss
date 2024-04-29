//
//  ViewController.swift
//  WorkshopIOSTV
//
//  Created by Khaled Guedria on 10/18/20.
//  Copyright © 2020 Khaled Guedria. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //var
    var data = ["El Camino","Extraction","Project Power","Six Underground","Spenser Confidential","The Irishman"]
    
    
    //widgets
    
    
    

    //Data source protocol
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookmarkCell", for: indexPath)
        let cv = collCell.contentView
        let imageview = cv.viewWithTag(1) as! UIImageView
        imageview.image = UIImage(named: data[indexPath.row])
        
        return collCell
        
    }
    
    //Delegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "toDetailsSegue" {
            let index = sender as! IndexPath
            let destination = segue.destination as! DetailsViewController
            destination.movieName = data[index.row]
        }
    }
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    

}

