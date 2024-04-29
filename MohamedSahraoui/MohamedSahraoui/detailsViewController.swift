//
//  detailsViewController.swift
//  MohamedSahraoui
//
//  Created by Apple Esprit on 17/11/2021.
//

import UIKit
import CoreData

class detailsViewController: UIViewController  , UICollectionViewDataSource ,UICollectionViewDelegate{
    
    
    var names = [String]()
    var hostnames = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mCell2", for: indexPath)
        
        let cv = cell.contentView
        let hostLabel = cv.viewWithTag(3) as! UILabel
        let nameLabel = cv.viewWithTag(2) as! UILabel
        let imageView = cv.viewWithTag(1) as! UIImageView
        
        nameLabel.text = names[indexPath.row]
        hostLabel.text = hostnames[indexPath.row]
       
        imageView.image = UIImage(named: hostnames[indexPath.row])

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteItem(index: indexPath.row)
            hostnames.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()

        // Do any additional setup after loading the view.
    }
    
    func fetch() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "name")
        
        do {
            
            let name = try managedContext.fetch(request)
            for item in name {
                
                names.append(item.value(forKey: "name") as! String)
                hostnames.append(item.value(forKey: "host") as! String)
                
            
            } catch   {
            
            print("Fetching error !")
        }
        
    }
        
        func AddElements() {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistentContainer = appDelegate.persistentContainer
            let managedContext = persistentContainer.viewContext
            
            for item in hostnames {
                
                let object = getByCreateria(name: item)
                managedContext.delete(object)
            }
            
            func getByCreateria(name: String) -> NSManagedObject{
                
                var hostExist:NSManagedObject?
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let persistentContainer = appDelegate.persistentContainer
                let managedContext = persistentContainer.viewContext
                
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Host")
                let predicate = NSPredicate(format: "name = %@", name)
                request.predicate = predicate
                
                do {
                    let result = try managedContext.fetch(request)
                    if result.count > 0 {
                        
                        hostExist = (result[0] as! NSManagedObject)
                        print("request added exists !")
                        
                    }
                    
                } catch {
                    
                    print("Fetching by criteria error !")
                }
                
                
                return hostExist!
            }
            

    }
    
        
        func deleteItem(index: Int){
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistentContainer = appDelegate.persistentContainer
            let managedContext = persistentContainer.viewContext
            
            let request = NSFetchRequest<NSManagedObject>(entityName: "Host")
            let predicate = NSPredicate(format: "hostname = %@",hostname[index])
            request.predicate = predicate
            
            do {
         let result  = try managedContext.fetch(request)
                if result.count > 0 {
                    let obj = result[0]
                    managedContext.delete(obj)
                    print("DELETED SUCCESSFULLY")
                }
            } catch  {
                print("FETCHING ERROR")
            }
        }
    
    
   
    }
}
