//
//  UserListViewController.swift
//  BloodBankApp
//
//  Created by Techsviewer on 6/6/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage
import SDWebImage

class UserListViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var name: UILabel!
    
    var userList = [users]()
    let userDic = [String:users]()
    var finalData = [users]()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var ref:DatabaseReference!
    var tmpUser:users?
    var tmpImg:UIImageView? = nil
    let brainService = brain()
    
    
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
        let logoutController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginController")
        //self.navigationController?.popToViewController(logoutController, animated: true)
        navigationController?.navigationController?.popToRootViewController(animated: true)
    
        delegate.currentUser = nil
        
    }
    
    @IBAction func logOut(_ sender: UIBarButtonItem)
    {
        handleLogout()
    }
    
    func getData()
    {
        ref = Database.database().reference()
        
        ref.child("Users").observe(.value)
        { (snapshot) in
            
            let obj = snapshot.value as! [String:AnyObject]
            
            for item in obj.keys{
                
                guard let objects = obj[item] as? [String:Any] else {return}
                
                let userInfo = users(name: objects["name"] as! String, age: objects["age"] as! Int, sex: objects["sex"] as! String, bloodType: objects["bloodType"] as! String, email: objects["email"] as! String, pass: objects["pass"] as! String, img: nil, contactNo: objects["contactNo"] as! Int,  address: objects["address"] as! String, otherInfo: objects["otherInfo"] as! String, doner: objects["doner"] as! Bool, receiver: objects["receiver"] as! Bool, isActive: objects["isActive"] as! Bool, downloadURL: objects["downloadURL"] as? String, userID: objects["userID"] as! String)
                
                self.userList.append(userInfo)
                
                
                self.brainService.finalData = self.finalData
                self.brainService.userList = self.userList
            }
            
            self.finalData = self.brainService.getUsers(userInfo: self.userList)
            
            print(self.finalData.count,"888888888888")
            self.userTableView.reloadData()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        name.text = delegate.currentUser?.userName
        self.title = name.text
        
        self.completionAlert(msg: "Successfully Logged In", controller: self)
        
        getData()
        
        if Auth.auth().currentUser?.uid == nil
        {
            handleLogout()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToUsersProfile = segue.destination as! UsersProfileViewController
        goToUsersProfile.tmpUser = tmpUser
    }
    
}






extension UserListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        cell.name.text = " \(finalData[indexPath.row].userName) "
        cell.bloodType.text = "\(finalData[indexPath.row].userBloodType)"

        let imgURLString = "\(finalData[indexPath.row].downloadURL!)"
        
        let imgURL = NSURL(string: imgURLString)
        cell.img.sd_setImage(with: imgURL! as URL, placeholderImage: #imageLiteral(resourceName: "anon"))
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return finalData.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tmpUser = finalData[indexPath.row]
        let selectedIndex = indexPath
        let selectedCell = tableView.cellForRow(at: selectedIndex) as! ProfileTableViewCell

        selectedCell.detailBtnOutlet.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let selectedCell = tableView.cellForRow(at: indexPath) as! ProfileTableViewCell
        
        selectedCell.detailBtnOutlet.isHidden = true
    }

}

