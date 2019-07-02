
import UIKit

class PInfoSignUpViewController: UIViewController,UIImagePickerControllerDelegate {

    enum pIRequiredField:String
    {
        case name = "User Name"
        case age = "Age"
        case gender = "Gender"
        case bloodtype = "Blood Type"
    }
    
    let bloodType = [
                        EnumsViewController.BType.a,
                        EnumsViewController.BType.b,
                        EnumsViewController.BType.c,
                        EnumsViewController.BType.d,
                        EnumsViewController.BType.e,
                        EnumsViewController.BType.f,
                        EnumsViewController.BType.g,
                        EnumsViewController.BType.h
                    ]
    
    let sex = [ EnumsViewController.Gender.Male , EnumsViewController.Gender.Female ]
    
    var error = ""
    var gender = UIPickerView()
    var bType = UIPickerView()
    
    var tmpUser:[users] = []
    var user = [users]()

    @IBAction func getImg(_ sender: UIButton)
    {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.allowsEditing = true
        self.present(imgPicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var nameTxt: designableTxtField!
    @IBOutlet weak var ageTxt: designableTxtField!
    @IBOutlet weak var genderTxt: designableTxtField!
    @IBOutlet weak var bloodTypeTxt: designableTxtField!
    @IBOutlet weak var userImage: designableUIImageView!
    
    
    
    
    @IBAction func nextButton(_ sender: designableUIButton)
    {
        if nameTxt.text?.isEmpty == true
        {
            alert(msg: "Please Enter Name", controller: self, textField: nameTxt)
        }
        else if ageTxt.text?.isEmpty == true
        {
            alert(msg: "Please Enter Age", controller: self, textField: ageTxt)
        }
        else if genderTxt.text?.isEmpty == true
        {
            alert(msg: "Please Enter Gender", controller: self, textField: genderTxt)
        }
        else if bloodTypeTxt.text?.isEmpty == true
        {
            alert(msg: "Please Enter BloodType", controller: self, textField: bloodTypeTxt)
        }
        else
        {
//        print(user[0].userName,user[0].userAge,user[0].userSex,user[0].userBloodType,user[0].isDoner,user[0].isReceiver,user[0].isActive)
            
            user.last?.userName = nameTxt.text!
            user.last?.userAge = Int(ageTxt.text!)!
            user.last?.userSex = genderTxt.text!
            user.last?.userBloodType = bloodTypeTxt.text!
            
//        print(user[0].userName,user[0].userAge,user[0].userSex,user[0].userBloodType,user[0].isDoner,user[0].isReceiver,user[0].isActive)
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genderTxt.inputView = gender
        bloodTypeTxt.inputView = bType
        
        gender.delegate = self
        bType.delegate = self
        
        bloodTypeTxt.delegate = self
        genderTxt.delegate = self

        bType.backgroundColor = .black
        gender.backgroundColor = .black
        createPickerViewToolbar()
        
        
        user = tmpUser
 
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let goToAccountInfo = segue.destination as! AInfoSignUpViewController
        
        goToAccountInfo.AItmpImg = userImage.image!
        goToAccountInfo.tmpUser = user
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }

}

extension PInfoSignUpViewController
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {

        if let selectedImg = info["UIImagePickerControllerOriginalImage"] as? UIImage
        {
            userImage.image = selectedImg
        }
        picker.dismiss(animated: true , completion: nil)
    }
}



extension PInfoSignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == gender
        {
            return sex.count
        }
        else
        {
            return bloodType.count
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == gender
        {
            return sex[row].rawValue
        }
        else
        {
            return bloodType[row].rawValue
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == gender
        {
            genderTxt.text = sex[row].rawValue
        }
        if pickerView == bType
        {
            bloodTypeTxt.text = bloodType[row].rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        var label:UILabel
        
        if let view = view as? UILabel
            {
                label = view
            }
        else
            {
                label = UILabel()
            }
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 20)
        
        if pickerView == gender
        {
            label.text = sex[row].rawValue
        }
        else
        {
            label.text = bloodType[row].rawValue
        }
        
        return label
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if textField == genderTxt || textField == bloodTypeTxt
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    
    
    func createPickerViewToolbar()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePressed))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .black
        
        bloodTypeTxt.inputAccessoryView = toolBar
        genderTxt.inputAccessoryView = toolBar
    }
    
    @objc func donePressed()
    {
        view.endEditing(true)
    }
}

