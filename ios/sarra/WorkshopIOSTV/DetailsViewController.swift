//
//  DetailsViewController.swift
//  WorkshopIOSTV
//
//  Created by Khaled Guedria on 10/18/20.
//  Copyright © 2020 Khaled Guedria. All rights reserved.
//

import UIKit
import CoreData


class DetailsViewController: UIViewController {
    
    //var
    var movieName:String?
    
    
    
    
    //Widgets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    
    
    
    //Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //OnStart
        movieImageView.image = UIImage(named: movieName!)
        movieNameLabel.text = movieName!

}
    
    
    
    //IBActions
    @IBAction func saveToFavsAction(_ sender: Any) {
        //TO DO : Call insert Method
        if !fechOneByCriteria(movie: movieName!) {
        insertMovie()
        }else {
            prompt(title: "warning", message: "Movie laready exists")
        }
    }
    
    

    
    //FUNCTIONS
    func insertMovie() {
        
        //TO DO : Insert movie entity in core data [local storage]
        //1
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        //2
        let persistentContainer = appdelegate.persistentContainer
        //3
        let managedContext = persistentContainer.viewContext
        //4
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)
        //5
        let favMovie = NSManagedObject.init(entity: entity!, insertInto: managedContext)
        //6
        favMovie.setValue(movieName, forKey: "moviename")
        //7
        do {
            try managedContext.save()
            prompt(title: "success", message: "Movie added succefully")
        } catch  {
            prompt(title: "error", message: "error while inserting")
        }
        
        
    }
    
    //GET BY NAME
    /*func getByCreateria(movieName: String) -> NSManagedObject{
        
        //TO DO : Fetch by criteria action
        
    }*/
    
    
    func prompt(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
   
    
    

//fechOne
func fechOneByCriteria(movie :String) -> Bool {
    var isExist = false
    //1
    let appdelegate=UIApplication.shared.delegate as! AppDelegate
    //2
    let persistentContainer = appdelegate.persistentContainer
    //3
    let managedContext = persistentContainer.viewContext
    //4
    let request=NSFetchRequest<NSManagedObject>(entityName: "Movie")
    //5
    let predicate=NSPredicate(format: "moviename = %@", movie)
    //6
    request.predicate=predicate
    do {
        //7
        let result = try managedContext.fetch(request)
        //8
        if result.count>0 {
            isExist=true
        }
    }catch{
        prompt(title: "warning", message: "movie already exist !")
    }
    
    
    return isExist
}
}


    



