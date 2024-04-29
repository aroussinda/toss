//
//  Utilities.swift
//  tournoi
//
//  Created by Apple Esprit on 9/11/2021.
//

import UIKit

class Utilities: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    static func isPasswordValide(_ password : String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES%", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}")
        return passwordTest.evaluate(with: password)
    }

}
