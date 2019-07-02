//
//  DesignableUITextView.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/19/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

@IBDesignable
class designableUITextView: UITextView
{
    @IBInspectable public var applyEffect: Bool = false
    {
        didSet
            {
                self.layer.cornerRadius = 5
                self.layer.masksToBounds = true
                self.backgroundColor = UIColor(red: 151/255, green: 133/255, blue: 133/255, alpha: 0.4)
                self.textColor = UIColor(white: 0.9, alpha: 0.8)
                self.font = UIFont(name: "Avenir", size: 17.0)
                self.autocorrectionType = .no
                
            }
    }


//    func updateView()
//    {
//        let textView = UITextView()
//        let containerView = UIView()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(textView)
//
//        textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
//        textView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
//        textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//        textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
//        textView.textContainer.maximumNumberOfLines = 4
//        textView.textContainer.lineBreakMode = .byTruncatingTail
//        textView.font = UIFont(name: "Avenir", size: 17)
//        textView.heightAnchor.constraint(equalToConstant: 400).isActive = true
//
//    }
}
