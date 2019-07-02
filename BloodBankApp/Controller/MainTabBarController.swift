//
//  MainTabBarController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 10/12/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    


//    let navDelegate = UIApplication.shared.delegate as! AppDelegate
//
//    @objc func handleLogout()
//    {
//        do
//        {
//            try Auth.auth().signOut()
//        }
//        catch let logoutError
//        {
//            print(logoutError)
//        }
//
//        let logoutController = LoginViewController()
//        present(logoutController, animated: true, completion: nil)
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
//        navigationItem.title = navDelegate.currentUser?.userName
//        self.title = "HELLO"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
