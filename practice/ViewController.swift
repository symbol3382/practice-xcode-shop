//
//  ViewController.swift
//  practice
//
//  Created by Gourav Verma on 07/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var temsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.set("Some value here", forKey: "keyOne")
    }
    
}

