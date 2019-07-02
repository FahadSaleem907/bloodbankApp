//
//  AlertViewController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/21/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    
    func validationAlert() -> UIAlertController
    {
        let alert = UIAlertController(title: "Error", message: "One or more required fields are missing.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        return alert
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
