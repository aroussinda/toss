//
//  ViewController.swift
//  MohamedSahraoui
//
//  Created by Apple Esprit on 17/11/2021.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    
    var name = ["HAlex Abbe","HEmiley Jackson","HJack Tomshon","HJoe Hamilton","HSam Aderson","HStevie Bagley","HZoe Sug"]
    
    var host = ["h1","h2","h3","h4","h5","h6","h7"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return name.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1",for: indexPath)
                let contentView = Cell.contentView
                let img = contentView.viewWithTag(1) as! UIImageView
                let label = contentView.viewWithTag(2) as! UILabel
            
                
                label.text = name[indexPath.row]
                
                img.image = UIImage(named: name[indexPath.row])
                return Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seguee", sender: indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguee" {
            let indexPath = sender as! IndexPath
            let destination = segue.destination as! detailsViewController
            destination.names = fullname[indexPath.row]
            destination.hostnames = host[indexPath.row]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

