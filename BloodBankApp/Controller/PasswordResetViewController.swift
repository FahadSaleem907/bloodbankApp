//
//  PasswordResetViewController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 6/7/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class PasswordResetViewController: UIViewController
{
    
    @IBOutlet weak var resetPwOption: designableSegments!
    
    
    func throughEmail()
    {
        let emailController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usingEmail")
        
        present(emailController, animated: true, completion: nil)
    }
    
    func throughPassword()
    {
        let passwordController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usingPassword")
        
        present(passwordController, animated: true, completion: nil)
    }
    
    
    @IBAction func resetPw(_ sender: designableUIButton)
    {
        if resetPwOption.selectedSegmentIndex == 0
        {
            throughEmail()
        }
        if resetPwOption.selectedSegmentIndex == 1
        {
            throughPassword()
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = false
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
