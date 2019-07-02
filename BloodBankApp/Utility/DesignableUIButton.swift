//
//  DesignableUIButton.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/15/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

@IBDesignable
class designableUIButton: UIButton
{
    @IBInspectable public var cornerRadius: CGFloat = 0.0
        {
        didSet
            {
                self.layer.cornerRadius = cornerRadius
                self.layer.masksToBounds = true
            }
        }
    
    @IBInspectable public var shadowWidth: CGFloat = 0.0
        {
        didSet
            {
                self.layer.shadowOpacity = 1.0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = UIColor.gray.cgColor
            }
        }
    
    @IBInspectable public var buttonColor: UIColor = UIColor.clear
        {
            didSet
                {
                    self.layer.backgroundColor = buttonColor.cgColor
                }
        }
}
