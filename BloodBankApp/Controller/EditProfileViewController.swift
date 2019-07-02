import UIKit
import Firebase
import FirebaseStorage

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    let delegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet weak var addressTxt: designableTxtField!
    @IBOutlet weak var profileImg: designableUIImageView!
    @IBOutlet weak var contactNoTxt: designableTxtField!
    
    @IBAction func updateProfile(_ sender: designableUIButton)
    {
        if contactNoTxt.text?.isEmpty == true
        {
            alert(msg: "Enter Contact No.", controller: self, textField: contactNoTxt)
        }
        else if addressTxt.text?.isEmpty == true
        {
            alert(msg: "Enter Address", controller: self, textField: addressTxt)
        }
        else
        {
            if Auth.auth().currentUser?.uid != nil
                {
                    delegate.currentUser?.userAddress = addressTxt.text!
                    delegate.currentUser?.userContactNo = Int(contactNoTxt.text!)!

                    self.uploadImage(uid: "\(Auth.auth().currentUser!.uid)")
                }
        else
        {
            print("Log in first")
        }
        }
    }
    
    var userImg:UIImage? = nil
    var tmpDownloadURL = ""
    
    func addUser(newUser:users) -> [String:Any]
    {
        return ["contactNo": newUser.userContactNo,  "address": newUser.userAddress, "downloadURL": newUser.downloadURL!, "userID": newUser.userID]
    }
    
    func handleUpdate()
    {
        self.dismiss(animated: true, completion: nil)

        //self.navigationController?.popViewController(animated: true)        
    }
    
    
    
    @IBAction func getImg(_ sender: UIButton)
    {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.allowsEditing =  true
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        addressTxt.text = delegate.currentUser!.userAddress
        contactNoTxt.text = String(delegate.currentUser!.userContactNo)
        
        let imgURL = NSURL(string: "\(delegate.currentUser!.downloadURL!)")
        
        profileImg.sd_setImage(with: imgURL! as URL, placeholderImage: #imageLiteral(resourceName: "anon"))
        
//        DispatchQueue.main.async
//            {
//                self.getSelectedUserImage(uid: "\(Auth.auth().currentUser!.uid)")
//                self.uploadImage(uid: "\(Auth.auth().currentUser!.uid)")
//            }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func uploadImage(uid:String)
    {
        
        var storageRef:StorageReference!
        storageRef = Storage.storage().reference()
        let storageFile = storageRef.child("ProfileImage").child("\(uid)")
        print(storageFile.fullPath)
        print(storageFile.bucket)
        var imageData:Data? = nil
        

        if profileImg.image == nil
        {
            profileImg.image = userImg
            imageData = UIImageJPEGRepresentation(profileImg.image!, 0.2)
            print(imageData!)
        }
        else
        {
            imageData = UIImageJPEGRepresentation(profileImg.image!, 0.2)
            print(imageData!)
        }
            
            
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
                self.tmpDownloadURL = downloadURL
                self.delegate.currentUser?.downloadURL = self.tmpDownloadURL
                
                var ref:DatabaseReference!
                ref = Database.database().reference()
                ref.child("Users").child((Auth.auth().currentUser?.uid)!).updateChildValues(self.addUser(newUser: self.delegate.currentUser!))
                
                self.handleUpdate()
                
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.dismiss(animated: true, completion: nil)
    }
}



extension EditProfileViewController
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {

        if let selectedImg = info["UIImagePickerControllerOriginalImage"] as? UIImage
        {
            profileImg.image = selectedImg
        }
        picker.dismiss(animated: true , completion: nil)
    }
}
