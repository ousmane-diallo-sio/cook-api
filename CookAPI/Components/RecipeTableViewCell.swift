//
//  RecipeTableViewCell.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 13/01/2023.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeView: RecipeView!
    
    func redraw(recipe: RecipeModel) {
        recipeView.updateData(recipe: recipe)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
