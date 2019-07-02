//
//  DesignableImageView.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/15/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

@IBDesignable
class designableUIImageView: UIImageView {
    
    @IBInspectable public var roundFrame: Bool = false
        {
        didSet
        {
            self.layer.cornerRadius = self.frame.height / 2
            self.layer.masksToBounds = true
            self.contentMode = .scaleAspectFill
        }
        }
    
//    @IBInspectable public var equalHeightWidth: Bool = false
//        {
//            didSet
//            {
//                if self.layer.frame.height > self.layer.frame.width
//                {
//                    repeat
//                    {
//                        self.layer.frame.height - 0.5
//                    }
//                    while self.layer.frame.height != self.layer.frame.width
//                }
//
//                if self.layer.frame.height < self.layer.frame.width
//                {
//                    repeat
//                    {
//                        self.layer.frame.height + 0.5
//                    }
//                        while self.layer.frame.height != self.layer.frame.width
//                }
//            }
//        
//
//        }
}
