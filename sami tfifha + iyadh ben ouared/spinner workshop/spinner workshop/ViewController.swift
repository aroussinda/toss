//
//  ViewController.swift
//  spinner workshop
//
//  Created by Apple Esprit on 12/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        spinner.startAnimating()
    }


}

