//
//  ViewController.swift
//  boxoffice
//
//  Created by Apple Esprit on 8/2/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    let data = ["El Camino","Extraction","Project Power","Six Underground","Spenser Confidential","The Irishman"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contentView = cell?.contentView
        let label = contentView?.viewWithTag(2) as! UILabel
        let imageView = contentView?.viewWithTag(1) as! UIImageView
        label.text = data[indexPath.row]
        imageView.image = data[indexPath.row]
        
        return cell!
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

