//
//  DesignableUIView.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/14/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUIView: UIView
{
        
        //For Border Color
        @IBInspectable public var borderColor : UIColor = UIColor.clear
            {
            didSet
            {
                self.layer.borderColor = borderColor.cgColor
            }
        }
        
        //For Border Width
        @IBInspectable public var borderWidth : CGFloat = 0.0
            {
            didSet
            {
                self.layer.borderWidth = borderWidth
            }
        }
        
        //For Corner Radius
        @IBInspectable public var cornerRadius : CGFloat = 0.0
            {
            didSet
            {
                self.layer.cornerRadius = cornerRadius
                self.layer.masksToBounds = true
            }
        }
        
        //For Shadow Opacity
        @IBInspectable public var shadowOpacity : CGFloat = 0.0
            {
            didSet
            {
                self.layer.shadowOpacity = Float(shadowOpacity)
            }
        }
        
        //For Shadow Color
        @IBInspectable public var shadowColor : UIColor = UIColor.clear
            {
            didSet
            {
                self.layer.shadowColor = shadowColor.cgColor
            }
        }
        
        //For Shadow Radius
        @IBInspectable public var shadowRadius : CGFloat = 0.0
            {
            didSet
            {
                self.layer.shadowRadius = shadowRadius
            }
        }
    
    
    }

