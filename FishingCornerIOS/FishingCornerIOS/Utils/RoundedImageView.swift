//
//  RoundedCornerImage.swift
//  FishingCornerIOS
//
//  Created by malek belayeb on 19/6/2021.
//

import UIKit

@IBDesignable

class RoundedImageView:UIImageView {
    
    
    override func layoutSubviews() {
        
        
        layer.cornerRadius = 6
        layer.borderWidth = 2
        layer.borderColor = UIColor(named: "Color 3")?.cgColor


    }
    
}
