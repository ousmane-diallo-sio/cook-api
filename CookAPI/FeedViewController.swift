//
//  FeedViewController.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 13/01/2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var recipes: [RecipeModel] = []
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeTableView.dataSource = self
        self.recipeTableView.delegate = self
        self.recipeTableView.register(
            UINib(nibName: "RecipeTableViewCell", bundle: nil),
            forCellReuseIdentifier: "RecipeCellId"
        )
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let testImgUrl = "https://testmatick.com/wp-content/uploads/2020/09/What-s-the-best-way-to-test-embedded-images-in-HTML.png"
        let r = RecipeModel(
            author: UserModel(username: "pseudo", firstname: "Prenom", lastname: "nom", email: "a@example.com", picture: testImgUrl),
            imgUrl: testImgUrl,
            title: "Ceci est le titre",
            desc: "Blabla je raconte n'importe quoi afin de tester",
            ingredients: [IngredientModel()],
            category: "nil",
            dish: "nil",
            steps: [RecipeStepModel()],
            rating: RatingModel.three
        )
        recipes.append(r)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCellId", for: indexPath) as! RecipeTableViewCell
        cell.redraw(recipe: recipes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return recipeTableView.subviews[indexPath.row].frame.size.width * 1.1
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
