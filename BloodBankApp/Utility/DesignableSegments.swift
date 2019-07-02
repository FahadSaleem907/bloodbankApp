//
//  DesignableSegments.swift
//  BloodBankApp
//
//  Created by Techsviewer on 9/16/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

@IBDesignable
class designableSegments: UIControl
{
    var buttons = [UIButton]()
    var selectedView: UIView!
    var selectedSegmentIndex = 0
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.0
    {
        didSet
        {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.clear
    {
        didSet
        {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable
    public var commaSeperatedButtons: String = ""
    {
        didSet
        {
            updateView()
        }
    }
    
    @IBInspectable
    public var bgcolor: UIColor = UIColor.clear
    {
        didSet
        {
            self.backgroundColor = bgcolor
        }
    }
    
    @IBInspectable
    public var buttonTextColor: UIColor = UIColor.gray
    {
        didSet
        {
            updateView()
        }
    }
    
    @IBInspectable
    public var svColor: UIColor = UIColor.clear
    {
        didSet
        {
            updateView()
        }
    }
    
    @IBInspectable
    public var svTextColor: UIColor = UIColor.clear
    {
        didSet
        {
            updateView()
        }
    }
    
    
    func updateView()
    {
        buttons.removeAll()
        subviews.forEach
            {
                (view) in view.removeFromSuperview()
            }
        
        // We can also use this in ForEach .......   subviews.forEach { $0.removeFromSuperview() }  and it will work same
        
        let buttonItems = commaSeperatedButtons.components(separatedBy: ",")
        for i in buttonItems
        {
            let button = UIButton(type: .system)
            button.setTitle(i, for: .normal)
            button.setTitleColor(buttonTextColor, for: .normal)
            button.titleLabel?.textAlignment = .center
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(svTextColor, for: .normal)

        let selectorWidth = frame.width / CGFloat(buttonItems.count)
        selectedView = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selectedView.layer.cornerRadius = frame.height / 2
        selectedView.backgroundColor = svColor
        
        addSubview(selectedView)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
    }
    
    override func draw(_ rect: CGRect)
    {
        self.layer.cornerRadius = frame.height / 2
        self.layer.masksToBounds = true
    }
    
    @objc func buttonTapped(button:UIButton)
    {
        for (buttonIndex, i) in buttons.enumerated()
        {

            let selectorStartPosition = frame.width / CGFloat(buttons.count)*CGFloat(buttonIndex)
            
            if button.currentTitle == i.currentTitle
            {
                UIView.animate(withDuration: 0.3, animations:
                    {
                        self.selectedView.frame.origin.x = selectorStartPosition
                        self.selectedSegmentIndex = buttonIndex
                        print(self.selectedSegmentIndex)
                        print(selectorStartPosition)
                    }
                              )
                
                i.setTitleColor(svTextColor, for: .normal)
            }
            else
            {
                i.setTitleColor(buttonTextColor, for: .normal)
            }
    
        }
    sendActions(for: .valueChanged)
    }
    
}
