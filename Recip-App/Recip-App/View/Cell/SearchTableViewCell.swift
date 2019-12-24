//
//  SearchTableViewCell.swift
//  SoftxpertTaskApp
//
//  Created by mohamed on 12/19/19.
//  Copyright © 2019 injaz. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var recipeSource: UILabel!
    @IBOutlet weak var recipeHealthLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(data : Hits){
        // get image from url
        UIHelper.getImageFromUrl(urlImage: data.recipe!.image ?? "") { (image) in
             self.recipeImage.image = image
        }
        recipeLabel.text = data.recipe?.label
        recipeSource.text = data.recipe?.source
        for healthLabel in data.recipe!.healthLabels!{
            recipeHealthLabel.text = recipeHealthLabel.text! + " ," + healthLabel
        }
        
        
    }
    
}
