//
//  FavoritesViewController.swift
//  boxofficemovies
//
//  Created by Apple Esprit on 19/10/2021.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movies = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }
    //return table size
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    //reagit comme boucle pour faire l'affichage
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mCell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell")
        let content = mCell?.contentView
        let image = content?.viewWithTag(1) as! UIImageView
        let label = content?.viewWithTag(2) as! UILabel
        
        label.text = movies[indexPath.row]
        
        image.image = UIImage(named: movies[indexPath.row])
        
        return mCell!
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistentContainer = appDelegate.persistentContainer
            let managerContext = persistentContainer.viewContext
            managerContext.delete(deleFromCore(moviename: movies[indexPath.row]))
            if (managerContext.hasChanges) {
                do {
                    try managerContext.save()
                } catch  {
                    print("error save")
                }
            }
            movies.remove(at: indexPath.row)
            
            tableView.reloadData()
        }
        
    }
    
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managerContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        do {
         let result = try managerContext.fetch(request)
            for item in result {
                movies.append(item.value(forKey: "movieName") as! String)
            }
        } catch  {
            print("error fetch")
        }
        
    }
    
    func deleFromCore(moviename : String) -> NSManagedObject {
        var movieExist : NSManagedObject?
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managerContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        let predicate = NSPredicate(format: "movieName like %@", moviename)
        request.predicate = predicate
        
        do {
         let result = try managerContext.fetch(request)
            if ( result.count > 0) {
                movieExist = result[0]
            }
        } catch  {
            print("error fetch")
        }
        return movieExist!
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
