//
//  UIButtonStyle.swift
//  SoftxpertTaskApp
//
//  Created by mohamed on 12/20/19.
//  Copyright © 2019 injaz. All rights reserved.
//

import UIKit




class UIButtonStyle: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.backgroundColor = UIColor(hexString: "#F7A81E") // #eeab37
        self.tintColor = UIColor.white
        self.setTitleColor(UIColor.white, for: .normal)
        
    }
}
