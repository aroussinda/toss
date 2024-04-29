//
//  ChooseGameViewController.swift
//  
//
//  Created by Apple Esprit on 15/11/2021.
//

import UIKit

class ChooseGameViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    var type = ["Tournment","Friendly","Go & Back","With Friend","Random"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return type.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "mCell1")
        let contentView = cell1?.contentView
        
        let label1 = contentView?.viewWithTag(5) as! UILabel
        label1.text = type[indexPath.row]
        
        
        return cell1!
    }
    
   
    
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 
}
