//
//  ViewController.swift
//  ExamenIos
//
//  Created by ESPRIT on 1/3/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "mcell")
           let conetentView = cell?.contentView
           let image =  conetentView?.viewWithTag(1) as! UIImageView
           let nom = conetentView?.viewWithTag(3) as! UILabel
           let diplome = conetentView?.viewWithTag(4) as! UILabel

           let gouvernoart=conetentView?.viewWithTag(5) as! UILabel
           image.image=UIImage(named: lists[indexPath.row].image!)
           nom.text = lists[indexPath.row].nom
           diplome.text = lists[indexPath.row].diplome

           gouvernoart.text = lists[indexPath.row].gouvernorat


       

           return cell!
       }
       
    
     var lists = [Institu]()
    

     override func viewDidLoad() {
         super.viewDidLoad()
        let supcom = Institu(nom: "Supcom", diplome: "Licence", score: 148.5, image: "sup", gouvernorat: "Ariana")
    let isi = Institu(nom: "ISI", diplome: "Licence", score: 148.5, image: "isi", gouvernorat: "Ariana")
         let ihec = Institu(nom: "Supcom", diplome: "Licence", score: 130.7, image: "ii", gouvernorat: "Tunis")
         let insat = Institu(nom: "ihec", diplome: "Licence/prepa", score:165.01, image: "ihec", gouvernorat: "Tunis")
         lists.append(supcom)
            lists.append(isi)
            lists.append(ihec)
         lists.append(insat)

     }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = lists[indexPath.row] as! Institu
        
        
        performSegue(withIdentifier: "msegue", sender: item)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "msegue")
        {
            let parametre1 = sender as! Institu
            let destination = segue.destination as! DetailsInstituViewController
            destination.score = String(parametre1.score!)
            destination.image = parametre1.image
            destination.inst = parametre1
            
            
        }
    }
}

