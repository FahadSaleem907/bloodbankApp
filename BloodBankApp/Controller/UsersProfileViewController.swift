
import UIKit
import MessageUI

class UsersProfileViewController: UIViewController
{

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var profileImg: designableUIImageView!
    
    var tmpUser:users?
    var user:users?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        user = tmpUser
        
//        print(user?.userName, user?.userAge, user?.userBloodType)
        name.text = user!.userName
        age.text = String(user!.userAge)
        bloodType.text = user!.userBloodType
        
        let imgURL = NSURL(string: "\(user!.downloadURL!)")
        
        profileImg.sd_setImage(with: imgURL! as URL, placeholderImage: #imageLiteral(resourceName: "anon"))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func makeCall(_ sender: UIButton)
    {
        let numberURL:NSURL = NSURL(string: "TEL://\(user!.userContactNo)")! as NSURL
        UIApplication.shared.open(numberURL as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func composeMessage(_ sender: UIButton)
    {
        
    }
    
    @IBAction func createEmail(_ sender: UIButton)
    {
        
    }
    
    
}
