import UIKit
import Firebase

class ResetPwPopUpViewController1: UIViewController {

    
    @IBAction func resetFirstResponder(_ sender: UIButton)
    {
        self.emailTxt.resignFirstResponder()
    }
    
    @IBOutlet weak var emailTxt: designableTxtField!
    
    @IBAction func changePw(_ sender: designableUIButton)
    {
        self.emailTxt.resignFirstResponder()
    
        
        Auth.auth().sendPasswordReset(withEmail: "\(emailTxt.text!)", completion: nil)
        
        
        completionAlert4(msg: "An Email has been sent to the respected Email address.", controller: self)
     
        
       
        
        
    }
    
    func completionAlert4(msg:String, controller:UIViewController)
    {
        let alertCompletion = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        
        let buttonOK = UIAlertAction(title: "Okay", style: .default) { (_) in
            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)
           
        }
        alertCompletion.addAction(buttonOK)
        present(alertCompletion, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.dismiss(animated: true, completion: nil)
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
