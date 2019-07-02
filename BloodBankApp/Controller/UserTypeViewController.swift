//
//  UserTypeViewController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/23/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

class UserTypeViewController: UIViewController {
    
    var user = [users]()
    
    var isDoner = false
    var isReceiver = false
    
    @IBOutlet weak var userType: designableSegments!
    
    func setDonerandReceiverStatus()
    {
        if userType.selectedSegmentIndex == 0
        {
            isDoner = true
            isReceiver = false
        }
        else if userType.selectedSegmentIndex == 1
        {
            isDoner = true
            isReceiver = true
        }
        else if userType.selectedSegmentIndex == 2
        {
            isDoner = false
            isReceiver = true
        }
    }
    @IBAction func createUser(_ sender: designableUIButton)
    {
        setDonerandReceiverStatus()
        
        let user1 = users(name: "aaa", age: 111, sex: "xyz", bloodType: "xyz", email: "xyz@xyz.com", pass: "xyz", img: nil, contactNo: 123,  address: "xyz", otherInfo: "xyz", doner: isDoner, receiver: isReceiver, isActive: true, downloadURL: "xyz", userID: "xyz")

        user.append(user1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType.selectedSegmentIndex = 0
        user.removeAll()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToPersonalInfo = segue.destination as! PInfoSignUpViewController
        goToPersonalInfo.tmpUser = user
    }

}





extension UIViewController
{
    
    
    func alert(msg:String , controller:UIViewController, textField:UITextField)
    {
        
        let alertValidation = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
    
        let buttonOK = UIAlertAction(title: "Okay", style: .default)
        {
            (_) in textField.becomeFirstResponder()
        }
        
        alertValidation.addAction(buttonOK)

        
        present(alertValidation, animated: true, completion: nil)
        
    }
    
    func completionAlert(msg:String, controller:UIViewController)
    {
        let alertCompletion = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        
        let buttonOK = UIAlertAction(title: "Okay", style: .default) { (_) in self.navigationController?.popToRootViewController(animated: true)
            
        }
        alertCompletion.addAction(buttonOK)
        present(alertCompletion, animated: true, completion: nil)
        
    }
    
}

