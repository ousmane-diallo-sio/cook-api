//
//  RecipeTableViewCell.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 13/01/2023.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
        
    var recipe: RecipeModel?
    @IBOutlet weak var btnNavFullRecipe: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.recipe = nil
    }
    
    @IBOutlet weak var recipeView: RecipeView!
    
    func redraw(recipe: RecipeModel) {
        recipeView.updateData(recipe: recipe)
        self.recipe = recipe
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    @IBAction func seeFullRecipe(_ sender: Any) {
        if (recipe == nil) {
            return
        }
        FeedViewController.navigationController?.pushViewController(
            FullRecipeViewController.newInstance(recipeModel: self.recipe!),
            animated: true
        )
    }
}
