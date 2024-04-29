//
//  DetailsInstituViewController.swift
//  ExamenIos
//
//  Created by ESPRIT on 1/3/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class DetailsInstituViewController: UIViewController {
    var image:String?
    var score:String?
   var inst : Institu?

    @IBOutlet weak var scoredetail: UILabel!
    
    @IBOutlet weak var imagedetail: UIImageView!
    
    @IBOutlet weak var scoreIns: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoredetail.text = score
        imagedetail.image = UIImage(named: image!)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var idd: UISegmentedControl!
    
    @IBOutlet weak var moyennebac: UITextField!
    
  
    @IBOutlet weak var moyennearith: UITextField!
    
    @IBOutlet weak var moyennebacblanc: UITextField!
   

 
    @IBAction func Calculerbtn(_ sender: Any) {
    
 
        let moyenneBac = Float(moyennebac.text!)!
        var scoreNouveaux:Float?
        let moyenneBacblanc = Float(moyennebacblanc.text!)!

        let moyennearithe = Float(moyennearith.text!)!
          
          if moyenneBac >= 10 {
            if(idd.selectedSegmentIndex == 0){
                scoreNouveaux = moyenneBacblanc*10
                scoreNouveaux! += moyennearithe*2
                print(scoreNouveaux!)
          }
            if(idd.selectedSegmentIndex == 1 )
            {
                scoreNouveaux = moyenneBacblanc*10
                scoreNouveaux! += moyennearithe*0.75
                             print(scoreNouveaux!)
    }
        
if(idd.selectedSegmentIndex == 2){
              scoreNouveaux = moyenneBacblanc*10
    scoreNouveaux! += moyennearithe*1.75
              print(scoreNouveaux!)
        }
if(idd.selectedSegmentIndex == 3){
              scoreNouveaux = moyenneBacblanc*10
              scoreNouveaux! += moyennearithe*1
              print(scoreNouveaux!)
        }
  
       
    }
    
    else if moyenneBac > 9 && moyenneBacblanc > moyenneBac{
    
      if(idd.selectedSegmentIndex == 0){
        scoreNouveaux = moyenneBacblanc * 7.5
        scoreNouveaux! += moyenneBacblanc * 2.5
        scoreNouveaux! += moyennearithe * 2
                    print(scoreNouveaux!)
              }
                if(idd.selectedSegmentIndex == 1 )
                {
                    scoreNouveaux = moyenneBacblanc*7.5
                    scoreNouveaux! += moyenneBacblanc*2.5
                    scoreNouveaux! += moyennearithe*0.75
                                 print(scoreNouveaux!)
        }
            
    if(idd.selectedSegmentIndex == 2){
                  scoreNouveaux = moyenneBacblanc*7.5
        scoreNouveaux! += moyenneBacblanc*2.5
           scoreNouveaux! += moyennearithe*1.75
        
                  print(scoreNouveaux!)
            }
    if(idd.selectedSegmentIndex == 3){
                  scoreNouveaux = moyenneBacblanc*7.5
        scoreNouveaux! += moyenneBacblanc*2.5
        scoreNouveaux! += moyennearithe*1
                  print(scoreNouveaux!)
            }
      
        }
scoreIns.text = String(scoreNouveaux!)
}
 
    @IBAction func btnAddListe(_ sender: Any) {
        let scoreEtudiant = Float(scoreIns.text!)!
        let scoreInstitu = Float(score!)!
    if scoreEtudiant < scoreInstitu{
        let alert = UIAlertController(title: "error", message: "score insuffisant", preferredStyle: .alert)
        let action = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
          alert.addAction(action)
          self.present(alert, animated: true)
      }
      else{
          let delegate = UIApplication.shared.delegate as! AppDelegate
          let container = delegate.persistentContainer
          let context = container.viewContext
          
          
          let description = NSEntityDescription.entity(forEntityName: "Ins", in: context)
          let obj = NSManagedObject.init(entity: description!, insertInto: context)
          obj.setValue(inst!.diplome, forKey: "diplome")
          obj.setValue(inst!.gouvernorat, forKey: "gouvernorat")
          obj.setValue(inst!.image, forKey: "image")
          obj.setValue(inst!.nom, forKey: "nom")
          obj.setValue(inst!.score, forKey: "score")
          do {
              try context.save()
            print("add")
             
          } catch  {
              print("error")
          }
              
      }

}
}
