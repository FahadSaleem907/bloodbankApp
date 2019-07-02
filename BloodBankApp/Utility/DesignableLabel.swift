//
//  DesignableLabel.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/15/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

@IBDesignable
class designableLabel: UILabel {
    
    @IBInspectable public var effectApplied: Bool = false
        {
        didSet
        {
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 0.0
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowColor = UIColor.darkGray.cgColor
        }
        }
    
}
