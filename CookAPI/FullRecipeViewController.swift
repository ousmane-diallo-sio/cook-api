//
//  FullRecipeViewController.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 08/02/2023.
//

import UIKit

class FullRecipeViewController: UIViewController {

    @IBOutlet weak var recipeView: RecipeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeView.updateData(recipe: RecipeModel.currentRecipe!)
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
