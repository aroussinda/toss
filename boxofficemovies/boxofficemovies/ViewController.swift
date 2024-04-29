//
//  ViewController.swift
//  boxofficemovies
//
//  Created by Med Wajdi BRAHEM on 5/10/2021.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate{
    
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }*/
    var setDetails:String?
    //var
    var movies = ["El Camino","Extraction","Project Power","Six Underground","Spenser Confidential","The Irishman"]

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
            movies.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
    
   
    
    //onClick
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        // Create the alert controller
        let alertController = UIAlertController(title: "Movie Name", message: movies[indexPath.row], preferredStyle: .alert)

        // Create the actions
        let okAction = UIAlertAction(title: "Return to movie list", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        */
        
        //navigate to the storyboard by id
        /*let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let vc: UINavigationController = storyboard.instantiateViewController(withIdentifier: "MovieDetailStoryBoard") as! UINavigationController

        self.present(vc, animated: true, completion: nil)
        */
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieDetailLink" {
            if let vc = segue.destination as? MovieDetailsViewController {
                let indexPath = sender as! IndexPath
                let destination = segue.destination as! MovieDetailsViewController
                destination.txt = movies[indexPath.row]
            
            }
        }
        
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

