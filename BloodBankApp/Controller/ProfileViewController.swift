//
//  ProfileViewController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 6/7/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ProfileViewController: UIViewController {

    // Mark: Outlets
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var contactNo: UILabel!
    
    @IBOutlet weak var imageField: designableUIImageView!
    
    @IBAction func changePw(_ sender: designableUIButton)
    {
        pwChange()
    }
    
    @IBAction func editInfo(_ sender: designableUIButton)
    {
        updateProfile()
    }
    @IBAction func logOut(_ sender: UIBarButtonItem)
    {
        handleLogout()
    }
    
    func pwChange()
    {
        let passwordController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "usingPassword")
        
        present(passwordController, animated: true, completion: nil)
    }
    
    func updateProfile()
    {
        let editInfoController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "editInfo")
        
        present(editInfoController, animated: true, completion: nil)
    }
    
    @objc func handleLogout()
    {
        do
        {
            try Auth.auth().signOut()
        }
        catch let logoutError
        {
            print(logoutError)
        }
        
        let logoutController = LoginViewController()
        
        navigationController?.navigationController?.popToRootViewController(animated: true)
    }
    
    //Mark: Variables
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var uid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //var ref:DatabaseReference!
        //ref = Database.database().reference()
        
        name.text = delegate.currentUser?.userName
        age.text = String(delegate.currentUser!.userAge)
        gender.text = delegate.currentUser?.userSex
        bloodType.text = delegate.currentUser?.userBloodType
        address.text = delegate.currentUser?.userAddress
        email.text = delegate.currentUser?.userEmail
        contactNo.text = String(delegate.currentUser!.userContactNo)
        if Auth.auth().currentUser != nil
        {
            uid = Auth.auth().currentUser!.uid
        }
        
        self.title = name.text
        
        print(uid)
        
        let imgURL = NSURL(string: "\(delegate.currentUser!.downloadURL!)")
        
        imageField.sd_setImage(with: imgURL! as URL, placeholderImage: #imageLiteral(resourceName: "anon"))
        

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool)
    {
        address.text = delegate.currentUser?.userAddress
        contactNo.text = String(delegate.currentUser!.userContactNo)
        
        let imgURL = NSURL(string: "\(delegate.currentUser!.downloadURL!)")
        imageField.sd_setImage(with: imgURL! as URL, placeholderImage: #imageLiteral(resourceName: "anon"))
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToEditProfile = segue.destination as! EditProfileViewController
        
        goToEditProfile.userImg = imageField.image!
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
