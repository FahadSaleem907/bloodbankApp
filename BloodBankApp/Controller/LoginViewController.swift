//
//  ViewController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 6/6/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import RSLoadingView

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTxt: designableTxtField!
    @IBOutlet weak var pwTxt: designableTxtField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var tmpUsername = ""
    let tmpImg = #imageLiteral(resourceName: "anon")
    

    func handleLogin()
    {
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabBar")
        
        //loginController.selectedViewController = loginController.viewControllers?[0]
        //let navController = UINavigationController(rootViewController:loginController)
        self.navigationController?.pushViewController(loginController, animated: true)
        //present(loginController, animated: true, completion: nil)
    }
    
    func completionAlert1(msg:String, controller:UIViewController)
    {
        let alertCompletion = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        
        let buttonOK = UIAlertAction(title: "Okay", style: .default) { (_) in //self.navigationController?.popToRootViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
            
        }
        alertCompletion.addAction(buttonOK)
        present(alertCompletion, animated: true, completion: nil)
    }
    
    @IBAction func showLoadingHub()
    {
        let loadingView = RSLoadingView()
        loadingView.show(on: view)
        loadingView.mainColor = UIColor.red
    }
    
    func hideLoadingHub()
    {
        RSLoadingView.hide(from: view)
    }
    
//    @IBAction func showOnWindow()
//    {
//        let loadingView = RSLoadingView()
//        loadingView.showOnKeyWindow()
//    }
//
//    func hideLoadingHubFromKeyWindow()
//    {
//        RSLoadingView.hideFromKeyWindow()
//    }
    
    @IBAction func loginBtn(_ sender: designableUIButton)
    {
        showLoadingHub()
        
        if userNameTxt.text?.isEmpty == true
        {
            hideLoadingHub()
            alert(msg: "Enter A Username", controller: self, textField: userNameTxt)
        }
        else if pwTxt.text?.isEmpty == true
        {
            hideLoadingHub()
            alert(msg: "Enter A Password", controller: self, textField: pwTxt)
        }
        else
        {
            Auth.auth().signIn(withEmail: userNameTxt.text!, password: pwTxt.text!, completion:
                {
                    ( result,  error ) in
                    guard let _ = result?.user,
                        let uid = result?.user.uid
                    
                        else
                    {
                        self.hideLoadingHub()
                        self.completionAlert1(msg: "\(error!.localizedDescription)", controller: self)
                        print(error?.localizedDescription ?? "Error")
                        return
                    }
                    
                    var ref:DatabaseReference!
                    ref = Database.database().reference()
                    
                    ref.child("Users").child("\(uid)").observe(.value, with: { (snapshot) in
                        let obj = snapshot.value as! [String:Any]
                        let signedUser = users(name: obj["name"] as! String, age: obj["age"] as! Int, sex: obj["sex"] as! String, bloodType: obj["bloodType"] as! String, email: obj["email"] as! String, pass: obj["pass"] as! String, img: nil, contactNo: obj["contactNo"] as! Int,  address: obj["address"] as! String, otherInfo: obj["otherInfo"] as! String, doner: obj["doner"] as! Bool, receiver: obj["receiver"] as! Bool, isActive: obj["isActive"] as! Bool, downloadURL: obj["downloadURL"] as? String, userID: obj["userID"] as! String)
                        

                        self.appDelegate.currentUser = signedUser
                        self.tmpUsername = signedUser.userName
                        self.hideLoadingHub()
                        self.handleLogin()

                        
                    })
            })
  
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoggedUser()

        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func checkLoggedUser()
    {
        if Auth.auth().currentUser == nil
        {
            return
        }
        else
        {
            print(Auth.auth().currentUser)
            handleLogin()            
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.navigationBar.isHidden = true
        userNameTxt.text = ""
        pwTxt.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

}






//To Move OnScreen Text Up When Keyboard Appears

//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)


//}

//    @objc func keyboardWillChange(notification: Notification)
//    {
//        view.frame.origin.y = -1
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
//
//    }

