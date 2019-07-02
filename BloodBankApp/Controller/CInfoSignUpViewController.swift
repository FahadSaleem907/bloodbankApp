import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class CInfoSignUpViewController: UIViewController {

    var CItmpImg:UIImage? = #imageLiteral(resourceName: "anon")
    
//    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var addressTxt: designableTxtField!
    @IBOutlet weak var contactTxt: designableTxtField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var tmpUser:[users] = []
    var user = [users]()
    var uid = ""
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func addUser(newUser:users) -> [String:Any]
    {
        return ["name": newUser.userName, "age": newUser.userAge, "sex": newUser.userSex, "bloodType": newUser.userBloodType, "email": newUser.userEmail, "pass": newUser.userPassword, /*"img": newUser.userImage!,*/ "contactNo": newUser.userContactNo,  "address": newUser.userAddress, "otherInfo": newUser.userOtherInfo, "doner": newUser.isDoner, "receiver": newUser.isReceiver, "isActive": newUser.isActive, "downloadURL": newUser.downloadURL!, "userID": newUser.userID]
    }
    
    
    
    @IBAction func createAccount(_ sender: designableUIButton)
    {
        
        if addressTxt.text?.isEmpty == true
        {
            alert(msg: "Please Enter Address", controller: self, textField: addressTxt)
        }

        else if contactTxt.text?.isEmpty == true
        {
            alert(msg: "Enter Contact Number", controller: self, textField: contactTxt)
        }
        else if textView.text == "Enter Other Info..."
        {
    
            user.last?.userOtherInfo = "N/A"
            user.last?.userAddress = addressTxt.text!

            user.last?.userContactNo = Int(contactTxt.text!)!
            

        }
        else
        {
   
            user.last?.userAddress = addressTxt.text!
            user.last?.userContactNo = Int(contactTxt.text!)!
            user.last?.userOtherInfo = textView.text!
            
            print(user.last!.userEmail)
            
            guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
            delegate.userData.append(user.last!)


            print("\(user.count) is user Count")
            print("\(tmpUser.count) is tmpUser Count")
            print("\(delegate.userData.count) is userData Count")
            
            
            Auth.auth().createUser(withEmail: "\(user.last!.userEmail)", password: "\(user.last!.userPassword)")
            {
                (result, error) in
                
                if error != nil
                {
                    print(error!.localizedDescription)
                    print(error!)
                    return
                }
                
                guard let _ = result?.user,
                    let uid = result?.user.uid
                    else
                {
                    return
                }
                self.uid = uid
                self.user.last?.userID = uid
                
                self.uploadImage(uid: uid)
                
            }
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        textView.delegate = self

        checkTextView()
        
        if CItmpImg == nil
        {
            print("no img")
        }
        if CItmpImg != nil
        {
            userImage.image = CItmpImg
        }
        
        user = tmpUser
        
        // Do any additional setup after loading the view.
    }
    

    private func uploadImage(uid:String)
    {
        
        var storageRef:StorageReference!
        storageRef = Storage.storage().reference()
        let storageFile = storageRef.child("ProfileImage").child("\(uid)")
        print(storageFile.fullPath)
        print(storageFile.bucket)
        var imageData:Data? = nil
        

            imageData = UIImageJPEGRepresentation(userImage.image!, 0.2)
            print(imageData!)

        
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageFile.putData(imageData!, metadata: metaData)
        {
            (metaData, error) in
            guard let metaData = metaData else
            {
                print("Error: \(error?.localizedDescription ?? "Error")")
                return
            }
            storageFile.downloadURL
                {
                    (url, error) in
                    guard let downloadURL = url?.absoluteString else
                    {
                        print(error?.localizedDescription ?? "Error")
                        return
                    }
                    print(downloadURL)
                    self.user.last?.downloadURL = downloadURL
                    
                    var ref:DatabaseReference!
                    ref = Database.database().reference()
                    
                    ref.child("Users").child("\(uid)").updateChildValues(self.addUser(newUser: self.user.last!))
                    self.completionAlert(msg: "Congrats. The user has been created", controller: self)
            }
        }
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
        checkTextView()
    }

}

extension CInfoSignUpViewController: UITextViewDelegate
{
    
    func checkTextView()
    {
        if textView.hasText
        {
            return
        }
        else
        {
            textView.textColor = UIColor(white: 0.9, alpha: 0.8)
            textView.text = "Enter Other Info..."
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if textView.text == "Enter Other Info..."
        {
            textView.selectAll(nil)
        }
        else
        {
            return
        }
    }
}


