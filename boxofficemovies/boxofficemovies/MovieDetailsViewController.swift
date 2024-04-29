//
//  MovieDetailsViewController.swift
//  boxofficemovies
//
//  Created by Med Wajdi BRAHEM on 6/10/2021.
//
import UIKit
import CoreData

class MovieDetailsViewController: UIViewController {

    //var
    var txt:String?
    
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var MovieLabel: UILabel!
    @IBOutlet weak var MovieDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieLabel.text = txt
        ImageView.image = UIImage(named: txt!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMovie(_ sender: Any) {
        if checkMovie() {
            let alert = UIAlertController(title: "Warning", message: "movie already exist", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true)
            
        } else {
            insertMovie()
        }
        
    }
    
    func insertMovie() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managerContext = persistentContainer.viewContext
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Movie", in: managerContext)
        let object = NSManagedObject(entity: entityDescription!, insertInto: managerContext)
        object.setValue(txt!, forKey: "movieName")
        do {
            try managerContext.save()
            print("movie saved")
        } catch  {
            print("movie added")
        }
        
    }
    
    func checkMovie() -> Bool {
        var exist = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managerContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Movie")
        let predicate = NSPredicate(format: "movieName = %@", txt!)
        request.predicate = predicate
        
        do {
           let result = try managerContext.fetch(request)
            if result.count > 0 {
                exist = true
            }
            
        } catch  {
            print("error")
        }
        return exist
        
        
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
