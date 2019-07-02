import UIKit
import Firebase


class ResetPwUsingPwPopUpViewController: UIViewController {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var newPwTxt: designableTxtField!
    @IBOutlet weak var confirmPwTxt: designableTxtField!
    
    @IBAction func changePw(_ sender: designableUIButton)
    {
        if newPwTxt.text?.isEmpty == true
        {
            alert(msg: "Enter New Password", controller: self, textField: newPwTxt)
        }
        else if confirmPwTxt.text?.isEmpty == true
        {
            alert(msg: "Enter Confirmation Password", controller: self, textField: confirmPwTxt)
        }
        else
        {
            if newPwTxt.text == confirmPwTxt.text
            {
                if Auth.auth().currentUser?.uid != nil
                {
                    delegate.currentUser?.userPassword = newPwTxt.text!
                    
                    var ref:DatabaseReference!
                    ref = Database.database().reference()
                    ref.child("Users").child((Auth.auth().currentUser?.uid)!).updateChildValues(self.addUser(newUser: delegate.currentUser!))
                    
                    let newPw:String = self.newPwTxt.text!
                    
                    Auth.auth().currentUser?.updatePassword(to: "\(newPw)", completion: nil)
                    self.completionAlert2(msg: "Password Changed Successfully", controller: self)
                    self.dismiss(animated: true, completion: nil)
                    
                }
            }
            else
            {
                alert(msg: "Passwords do not match.", controller: self, textField: newPwTxt)
            }
        }
    }
    
    @IBAction func resetFirstResponder(_ sender: designableUIButton)
    {
        newPwTxt.resignFirstResponder()
        confirmPwTxt.resignFirstResponder()
    }
    
    func completionAlert2(msg:String, controller:UIViewController)
    {
        let alertCompletion = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        
        let buttonOK = UIAlertAction(title: "Okay", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
            
        }
        alertCompletion.addAction(buttonOK)
        present(alertCompletion, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func addUser(newUser:users) -> [String:Any]
    {
        return ["pass": newUser.userPassword]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//        self.dismiss(animated: true, completion: nil)
//    }

}
