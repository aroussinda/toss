//
//  ViewController.swift
//  collectionWorkshop
//
//  Created by Apple Esprit on 9/2/2022.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource {
    
    var data = ["El Camino.jpg","Extraction.jpg","Project Power.jpeg","Six Underground.png","Spenser Confidential.jpeg","The Irishman.jpeg"]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCell", for: indexPath)
        let content = cell.contentView
        let image =  content.viewWithTag(1) as! UIImageView
        image.image = UIImage(named: data[indexPath.row])
        return cell

    }
    
    



   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

