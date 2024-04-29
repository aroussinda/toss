//
//  detailsViewController.swift
//  tournoi
//
//  Created by Apple Esprit on 10/11/2021.
//

import UIKit

class detailsViewController: UIViewController {
    
    var gameName:String?
    
    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var gameImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameImage.image = UIImage(named: gameName!)

        gameLabel.text = gameName!

        // Do any additional setup after loading the view.
    }
    

  
    

}
