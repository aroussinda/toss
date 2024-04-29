//
//  MyEventTableViewCell.swift
//  FishingCornerIOS
//
//  Created by malek belayeb on 20/6/2021.
//

import UIKit

class MyEventTableViewCell: UITableViewCell {

    
    @IBOutlet weak var addressEvent: UILabel!
    
    @IBOutlet weak var imageEvent: UIImageView!
    
    @IBOutlet weak var dateEvent: UILabel!
    
    @IBOutlet weak var descriptionEvent: UILabel!
    
    
    @IBOutlet weak var titleEvent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
