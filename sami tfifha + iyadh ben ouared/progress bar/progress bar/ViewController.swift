//
//  ViewController.swift
//  progress bar
//
//  Created by Apple Esprit on 12/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var ProgressView: UIProgressView!
    @IBOutlet var progressBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ProgressView.progress = 0.0

    }

    @IBAction func buttonPressed(_ sender: Any) {
        var progress: Float = 0.0
        ProgressView.progress = progress
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: {(timer) in
            progress == 1.0
            self.ProgressView.progress = progress
            
            if self.ProgressView.progress == 100.0
            {
                self.ProgressView;progress = 0.0
            }
            })



    }

    
}

