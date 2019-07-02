import UIKit
import Firebase

class brain
{
    
    var finalData = [users]()
    var userList = [users]()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    //let userDictionary = users(name: objects["name"] as! String, age: objects["age"] as! Int, sex: objects["sex"] as! String, bloodType: objects["bloodType"] as! String, email:        objects["email"] as! String, pass: objects["pass"] as! String, img: nil, contactNo: objects["contactNo"] as! Int,  address: objects["address"] as! String, otherInfo: objects["otherInfo"] as! String, doner: objects["doner"] as! Bool, receiver: objects["receiver"] as! Bool, isActive: objects["isActive"] as! Bool, downloadURL: objects["downloadURL"] as? String, userID: objects["userID"] as! String)
    
    
    func getUsers(userInfo:[users]) -> [users]
        {
            for i in userInfo
            {
                if i.isDoner == true
                {
                    if self.delegate.currentUser?.userBloodType == "A+"
                    {
                        finalData = userList.filter({ ( $0.userBloodType == "A+") || ($0.userBloodType == "A-") || ($0.userBloodType == "O+") || ($0.userBloodType == "O-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "A-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "A-") || ($0.userBloodType == "O-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "AB+"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "A+") || ($0.userBloodType == "A-") || ($0.userBloodType == "AB+") || ($0.userBloodType == "AB-") || ($0.userBloodType == "B+") || ($0.userBloodType == "B-") || ($0.userBloodType == "O+") || ($0.userBloodType == "O-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "AB-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "A-") || ($0.userBloodType == "AB-") || ($0.userBloodType == "B-") || ($0.userBloodType == "O-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "B+"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "B+") || ($0.userBloodType == "B-") || ($0.userBloodType == "O+") || ($0.userBloodType == "O-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "B-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "B-") || ($0.userBloodType == "O-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "O+"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "O+") || ($0.userBloodType == "O-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "O-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "O-") })
                    }
                }
    
                if i.isReceiver == true
                {
                    if self.delegate.currentUser?.userBloodType == "A+"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "A+") || ($0.userBloodType == "AB+") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "A-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "A+") || ($0.userBloodType == "A-") || ($0.userBloodType == "AB+") || ($0.userBloodType == "AB-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "AB+"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "AB+") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "AB-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "AB+") || ($0.userBloodType == "AB-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "B+"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "B+") || ($0.userBloodType == "AB+") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "B-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "B+") || ($0.userBloodType == "B-") || ($0.userBloodType == "AB+") || ($0.userBloodType == "AB-") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "O+"
                    {
                        self.finalData = userList.filter({ ($0.userBloodType == "A+") || ($0.userBloodType == "B+") || ($0.userBloodType == "AB+") || ($0.userBloodType == "O") })
                    }
                    else if self.delegate.currentUser?.userBloodType == "O-"
                    {
                        finalData = userList.filter({ ($0.userBloodType == "A+") || (i.userBloodType == "A-") || ($0.userBloodType == "AB+") || ($0.userBloodType == "AB-") || ($0.userBloodType == "B+") || ($0.userBloodType == "B-") || ($0.userBloodType == "O+") || ($0.userBloodType == "O-") })
                    }
                }
            }
            return finalData
}

    func getJsonData()
    {
        var ref:DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("Users").observe(.value)
        { (snapshot) in
            
            let objData = snapshot.value as! [String:Any]
        }
    }
    
}
