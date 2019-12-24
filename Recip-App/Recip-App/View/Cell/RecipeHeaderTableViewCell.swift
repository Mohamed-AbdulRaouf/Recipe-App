//
//  RecipeHeaderTableViewCell.swift
//  SoftxpertTaskApp
//
//  Created by mohamed on 12/20/19.
//  Copyright © 2019 injaz. All rights reserved.
//

import UIKit

class RecipeHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setup (count : Int){
        ingredientsLabel.text = "\(count) \(String(describing: ingredientsLabel.text!))"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
