import UIKit
import Foundation
import Firebase

class users//:Codable
{
    var userName:String
    var userAge:Int
    var userSex:String
    var userBloodType:String
    var userEmail:String
    var userPassword:String
    var userImage:UIImage?
    var userContactNo:Int
    var userAddress:String
    var userOtherInfo:String
    var isDoner:Bool
    var isReceiver:Bool
    var isActive:Bool
    var downloadURL:String?
    var userID:String
    init(name:String,age:Int,sex:String,bloodType:String,email:String,pass:String,img:UIImage?,contactNo:Int,address:String,otherInfo:String,doner:Bool,receiver:Bool,isActive:Bool,downloadURL:String?,userID:String)
    {
        self.userName       = name
        self.userAge        = age
        self.userSex        = sex
        self.userBloodType  = bloodType
        self.userEmail      = email
        self.userPassword   = pass
        self.userImage      = img
        self.userContactNo  = contactNo
        self.userAddress    = address
        self.userOtherInfo  = otherInfo
        self.isDoner        = doner
        self.isReceiver     = receiver
        self.isActive       = isActive
        self.downloadURL    = downloadURL
        self.userID         = userID
    }
    
    enum codingKeys: String,CodingKey
    {
        case userName = "name"
        case userAge = "age"
        case userSex = "sex"
        case userBloodType = "bloodType"
        case userEmail = "email"
        
        case userPassword = "pass"
        //case userImage = ""
        case userContactNo = "contactNo"
        case userAddress = "address"
        case userOtherInfo = "otherInfo"
        
        case isDoner = "doner"
        case isReceiver = "receiver"
        case isActive = "isActive"
        case downloadURL = "downloadURL"
        case userID = "userID"
    }
    
//    func encode(to encoder: Encoder) throws
//    {
//
//    }
//
//    required init(from decoder: Decoder) throws
//    {
//
//    }
    
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


