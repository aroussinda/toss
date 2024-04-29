
//
//  HomeViewController.swift
//  tournoi
//
//  Created by Apple Esprit on 9/11/2021.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    var data = ["Cod","Fifa","Freefire","Lol","Nba"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        
        let label = contentView?.viewWithTag(1) as! UILabel
        let imageView = contentView?.viewWithTag(2) as! UIImageView
        
        label.text = data[indexPath.row]
        imageView.image = UIImage(named: data[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tournoi = data[indexPath.row]

        performSegue(withIdentifier: "mSegue5", sender: tournoi)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tournoi = sender as! String
        let destination = segue.destination as! detailsViewController
        destination.gameName = tournoi
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
