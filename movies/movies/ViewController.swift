//
//  ViewController.swift
//  movies
//
//  Created by Apple Esprit on 13/10/2021.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var movies = ["El Camino","Extraction","Project Power","Six Underground","Spenser Confidential","The Irishman" ]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mcell", for: indexPath)
        var imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: movies[indexPath.row])
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}













