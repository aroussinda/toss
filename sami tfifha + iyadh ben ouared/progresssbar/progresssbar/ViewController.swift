//
//  ViewController.swift
//  progresssbar
//
//  Created by Apple Esprit on 12/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet var progressBar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.progress = 0.0

    }


    @IBAction func buttonPressed(_ sender: Any) {
        
        var progress: Float = 0.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (timer) in
                                     progress += 0.01
                                     self.progressView.progress = progress
                                     if self.progressView.progress == 100.0
                                     {
            self.progressView.progress = 0.0
        }
    })
}

}
