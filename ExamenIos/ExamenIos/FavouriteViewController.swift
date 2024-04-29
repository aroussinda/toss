//
//  FavouriteViewController.swift
//  ExamenIos
//
//  Created by ESPRIT on 1/3/21.
//  Copyright © 2021 ESPRIT. All rights reserved.
//

import UIKit
import CoreData

class FavouriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
              var datas = [Institu]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
               let delegate = UIApplication.shared.delegate as! AppDelegate
               let container = delegate.persistentContainer
               let context = container.viewContext
               
               let request = NSFetchRequest<NSManagedObject>(entityName: "Ins")
                       
                       do {
                           let results =  try context.fetch(request)
                           for item in results {
                            datas.append(Institu(nom: item.value(forKey: "nom") as! String, diplome: item.value(forKey: "diplome") as! String, score: item.value(forKey: "score") as! Float, image: item.value(forKey: "image") as! String, gouvernorat: item.value(forKey: "gouvernorat") as! String))
                           }
                       } catch  {
                           
                       }
                       // Do any additional setup after loading the view.
                   }
                   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                       return datas.count
                   }
                   
                   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                       let cell = tableView.dequeueReusableCell(withIdentifier: "mcell")
                       let contentView = cell?.contentView
                       let imageView = contentView?.viewWithTag(1) as! UIImageView
                       let labelNom = contentView?.viewWithTag(3) as! UILabel
                       let labelDiplome = contentView?.viewWithTag(4) as! UILabel
                       let labelPlace = contentView?.viewWithTag(5) as! UILabel
                       imageView.image = UIImage(named: datas[indexPath.row].image!)
                       labelNom.text =  datas[indexPath.row].nom
                       labelDiplome.text = datas[indexPath.row].diplome
                       labelPlace.text = datas[indexPath.row].gouvernorat
                       return cell!
                   }
                   
           

                   /*
                   // MARK: - Navigation

                   // In a storyboard-based application, you will often want to do a little preparation before navigation
                   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                       // Get the new view controller using segue.destination.
                       // Pass the selected object to the new view controller.
                   }
                   */

               }

