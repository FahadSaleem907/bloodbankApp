import UIKit

class EnumsViewController: UIViewController
{
    
enum BType:String
    {
        case a = "A+"
        case b = "A-"
        case c = "B+"
        case d = "B-"
        case e = "AB+"
        case f = "AB-"
        case g = "O+"
        case h = "O-"
    }
    
    enum RhFactor:String
    {
        case positive = "+"
        case negative = "-"
    }

    enum UserType:String
    {
        case isDoner = "Doner"
        case isReceiver = "Receiver"
        case both = "Both"
    }
    
    enum UserStatus: String
    {
        case isActive = "Active"
        case isInactive = "Inactive"
    }
    
    let userStatus = [ UserStatus.isActive , UserStatus.isInactive ]
    
    
    enum Gender: String
    {
        case Male = "Male"
        case Female = "Female"
        static var count: Int
        {
            return Gender.Female.hashValue + 1
        }
    }
 
    
}
