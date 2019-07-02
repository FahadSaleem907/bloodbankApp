//
//  DesignableTextField.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/15/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

@IBDesignable
class designableTxtField: UITextField
{
    @IBInspectable public var applyEffect: Bool = false
        {
        didSet
        {
            self.borderStyle = .none
            self.layer.cornerRadius = 5
            self.layer.masksToBounds = true
            self.backgroundColor = UIColor(red: 151/255, green: 133/255, blue: 133/255, alpha: 0.4)
            self.attributedPlaceholder = NSMutableAttributedString(attributedString: NSAttributedString(string: placeholder != nil ? "\(placeholder!)" : "", attributes: [NSAttributedStringKey.font : UIFont(name: "Avenir", size: 17.0)!, .foregroundColor: UIColor(white: 1.0, alpha: 0.7)]))
            self.textColor = UIColor(white: 0.9, alpha: 0.8)
            self.font = UIFont(name: "Avenir", size: 17.0)
            self.autocorrectionType = .no
        }
        }
    
    @IBInspectable
    public var addLeftImage: UIImage?
    {
        didSet
        {
            updateView1()
        }
    }
    
    @IBInspectable
    public var leftPadding: CGFloat = 0
    {
        didSet
        {
            updateView1()
        }
    }
    
    
    @IBInspectable
    public var textPadding: Bool = false
    {
        didSet
        {
            updateView2()
        }
    }
    
    func updateView1()
    {
        if let image = addLeftImage
        {
            leftViewMode = .always
            
            let img = UIImageView(frame: CGRect(x: leftPadding, y: 5, width: 35, height: 35))
            img.image = image
            
            
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
            view.addSubview(img)
            view.alpha = 0.3
            leftView = view
        }
        else
        {
            leftViewMode = .always
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
            
            view.alpha = 0.3
            leftView = view
        }
    }
    
    func updateView2()
    {
        leftViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        
        view.alpha = 0.3
        leftView = view
    }
    
}
