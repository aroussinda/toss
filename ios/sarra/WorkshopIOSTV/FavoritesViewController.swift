//
//  FavoritesViewController.swift
//  WorkshopIOSTV
//
//  Created by Khaled Guedria on 10/25/20.
//  Copyright © 2020 Khaled Guedria. All rights reserved.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var
    var favorites = [String]()
    

    @IBAction func clear(_ sender: Any) {
        
        //1
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        //2
        let persistentContainer = appdelegate.persistentContainer
        //3
        let managedContext = persistentContainer.viewContext
        //4
        let req = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        
        
        //5
        do {
            let result = try managedContext.fetch(req)
            for obj in  result {
                managedContext.delete(obj)
            }
            try managedContext.save()
        } catch  {
            print("delete error")
        }
        
        //refresh
        favorites.removeAll()
        tableView.reloadData()
        
        
    }
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let favCell = tableView.dequeueReusableCell(withIdentifier: "favCell")
        let contentView = favCell?.contentView
        
        let label = contentView?.viewWithTag(1) as! UILabel
        let imageView = contentView?.viewWithTag(2) as! UIImageView
        
        label.text = favorites[indexPath.row]
        imageView.image = UIImage(named: favorites[indexPath.row])
        

        return favCell!
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            //TO DO : Delete from Core Data
            
            deleteElement(tableView: tableView, index: indexPath.row)

            
            //TO DO : UIAlertController [Movie Deleted Successfully]

            
            
        }
    }

    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

        // Do any additional setup after loading the view.
    }
    
    
    func fetchData() {
        //1
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        //2
        let persistentContainer = appdelegate.persistentContainer
        //3
        let managedContext = persistentContainer.viewContext
        //4
        let req = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        //5
        do {
             
            //6
           let result = try managedContext.fetch(req)
            for item in result {
                
                //var movie = item as! NSManagedObject
                favorites.append(item.value(forKey: "moviename")as! String)
            }
            
        } catch {
            print("select error")
        }
        
    }
    
    func getByCreateria(movie: String) -> NSManagedObject{
      
      //TO DO : Fetch by criteria action
   
        var obj: NSManagedObject?
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
                obj=result[0]
            }
        }catch{
            print("error")
        }
        
        return obj!
   
  }    /*func getByCreateria(movieName: String) -> NSManagedObject{
        
        
        //TO DO : Fetch by criteria action
     
     
    }*/
    
    
    func deleteElement(tableView: UITableView, index: Int) {
        
        //TO DO : Delete From Core Data action
                        
        //TO DO : Delete From Core Data action
        var obj = getByCreateria(movie: favorites[index])
        //1
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        //2
        let persistentContainer = appdelegate.persistentContainer
        //3
        let managedContext = persistentContainer.viewContext
        //4
        managedContext.delete(obj)
            
        //5
        do {
            try managedContext.save()
        } catch  {
            print("delete error")
        }
        //refresh
        favorites.remove(at: index)
        tableView.reloadData()

    }

    }


