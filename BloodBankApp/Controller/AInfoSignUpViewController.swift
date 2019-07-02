//
//  AInfoSignUpViewController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/19/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

class AInfoSignUpViewController: UIViewController {
    
    var AItmpImg:UIImage = #imageLiteral(resourceName: "anon")
    
    @IBOutlet weak var userTxt: designableTxtField!
    @IBOutlet weak var userImage: designableUIImageView!
    @IBOutlet weak var pwTxt: designableTxtField!
    var tmpUser:[users] = []
    var user = [users]()
    
    
    @IBAction func goToContactInfo(_ sender: designableUIButton)
    {
        if userTxt.text?.isEmpty == true
        {
            alert(msg: "Please Enter User ID", controller: self, textField: userTxt)
        }
        else if pwTxt.text?.isEmpty == true
        {
            alert(msg: "Please Enter Password", controller: self, textField: pwTxt)
        }
            else if (pwTxt.text?.count)! < 6
        {
            alert(msg: "Password should contain atleast 6 characters.", controller: self, textField: pwTxt)
        }
            
        else
        {
//    print(user[0].userName,user[0].userAge,user[0].userSex,user[0].userBloodType,user[0].isDoner,user[0].isReceiver,user[0].isActive, user[0].userID,user[0].userPassword)
        
        self.userTxt.resignFirstResponder()
        self.pwTxt.resignFirstResponder()
        
        user.last?.userEmail = userTxt.text!
        user.last?.userPassword = pwTxt.text!
        
//    print(user[0].userName,user[0].userAge,user[0].userSex,user[0].userBloodType,user[0].isDoner,user[0].isReceiver,user[0].isActive, user[0].userID,user[0].userPassword)
        
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userImage.image = AItmpImg
        
        user = tmpUser

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToContactInfo = segue.destination as! CInfoSignUpViewController
        
        goToContactInfo.CItmpImg = userImage.image!
        goToContactInfo.tmpUser = user
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

}
