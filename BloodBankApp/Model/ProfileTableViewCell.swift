//
//  ProfileTableViewCell.swift
//  BloodBankApp
//
//  Created by Techsviewer on 6/9/18.
//  Copyright © 2018 HomePractice. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bloodType: UILabel!
    @IBOutlet weak var detailBtnOutlet: UIButton!
    
    @IBOutlet weak var img: designableUIImageView!
    
    @IBAction func detailViewBtn(_ sender: UIButton)
    {
        
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        detailBtnOutlet.isHidden = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
