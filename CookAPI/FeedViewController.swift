//
//  FeedViewController.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 13/01/2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static var navigationController: UINavigationController?

    var recipes: [RecipeModel]?
    
    @IBOutlet weak var recipeTableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipeTableView.dataSource = self
        self.recipeTableView.delegate = self
        self.recipeTableView.register(
            UINib(nibName: "RecipeTableViewCell", bundle: nil),
            forCellReuseIdentifier: "RecipeCellId"
        )
        FeedViewController.navigationController = self.navigationController
        self.getFeedRecipes()
        // Do any additional setup after loading the view.
        self.refreshControl.addTarget(self, action: #selector(self.refreshPage), for: .valueChanged)
        self.recipeTableView.addSubview(self.refreshControl)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCellId", for: indexPath) as! RecipeTableViewCell
        cell.redraw(recipe: recipes![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return recipeTableView.subviews[indexPath.section].frame.size.width * 1.1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func getFeedRecipes() {
        Database.getFeedRecipes { recipes, error in
            guard let err = error else {
                guard let recipes = recipes else { return }
                self.recipes = recipes
                self.recipeTableView.reloadData()
                self.refreshControl.endRefreshing()
                return
            }
            print("Error: (Could not load feed) \(err)")
        }
    }
    
    @objc func refreshPage() {
        self.getFeedRecipes()
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
