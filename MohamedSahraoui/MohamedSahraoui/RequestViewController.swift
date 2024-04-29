//
//  RequestViewController.swift
//  MohamedSahraoui
//
//  Created by Apple Esprit on 17/11/2021.
//

import UIKit
import CoreData

class RequestViewController: UIViewController {
    
    var fullname:String?
    var hostname:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alertMessage(message: String) {
        
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func request() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "name", in: managedContext)
        let object = NSManagedObject.init(entity: entityDescription!, insertInto: managedContext)
        
        object.setValue(fullname!, forKey: "name")
        object.setValue(hostname!, forKey: "host")
       
        
        do {
            
            try managedContext.save()
            alertMessage(message: "Your request is sent successfully !")
            
        } catch {
            
            alertMessage(message:"request insert error !")
        }


    }
}
