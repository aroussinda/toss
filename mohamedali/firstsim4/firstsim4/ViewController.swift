//
//  ViewController.swift
//  firstsim4
//
//  Created by Apple Esprit on 26/1/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //var
    
    var random = Int.random(in: 0..<100)
    var round = 0
    var score : Int = 0
    var sliderValue = 0
    var test : Int = 0
    
    //widgets
    @IBOutlet weak var hitButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    @IBOutlet weak var minScoreLabel: UILabel!
    
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitGame ()
        //PlayGame()// Do any additional setup after loading the view.
    }
    
    //actions
    
    func InitGame ()
    {
        slider.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: .normal)
        random = Int.random(in: 0..<100)
        scoreLabel.text = String(random)
        slider.value = 50
        roundLabel.text = "0"
        finalScoreLabel.text = "0"
        
    }
    func PlayGame()
    {
        test = 100 - Int(slider.value)
        roundLabel.text = String(round)
        if(Int(slider.value.rounded())==random)
        {
            score = score + 100
            round = round + 1
            Promt(msg: String(score))
            random = Int.random(in: 0..<100)
            scoreLabel.text = String(random)
            slider.value = 50
            finalScoreLabel.text = String(score)
        }
        else if (abs(random - Int(slider.value.rounded()))<5)
        {
            Promt(msg: String(score))
            score = score + 50
            round = round + 1
            random = Int.random(in: 0..<100)
            scoreLabel.text = String(random)
            slider.value = 50
            finalScoreLabel.text = String(score)
        }
        else
        {
            Promt(msg: String(score))
            score = score + 0
            round = round + 1
            
        }
        
        
    }
    func Promt(msg : String)
    {
        let alertController = UIAlertController(
                title: "Score",
                    message: msg,
                    preferredStyle: .alert)

        alertController.addAction(UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

    @IBAction func playgame(_ sender: Any) {
      PlayGame()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        InitGame()
    }
    
    
    @IBAction func actionSlider(_ sender: UISlider) {
      //  sliderValue = sender.value
    }
}

