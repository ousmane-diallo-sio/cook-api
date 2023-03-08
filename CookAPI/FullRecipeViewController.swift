//
//  FullRecipeViewController.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 08/02/2023.
//

import UIKit

class FullRecipeViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vContainer: UIStackView!
    @IBOutlet weak var ratingContainer: UIView!
    @IBOutlet weak var recipeView: RecipeView!
    @IBOutlet weak var lblIngredient0: UILabel!
    @IBOutlet weak var lblTitleStep0: UILabel!
    @IBOutlet weak var lblStep0: UILabel!
    @IBOutlet weak var ingredientsContainer: UIStackView!
    @IBOutlet weak var stepsContainer: UIStackView!
    
    var recipeModel: RecipeModel?
    var currentRating: RatingModel.RawValue = 1

    
    static func newInstance(recipeModel: RecipeModel) -> FullRecipeViewController {
        let instance = FullRecipeViewController()
        instance.recipeModel = recipeModel
        return instance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let recipeM = recipeModel else {
            print("Error -> FullRecipeViewController:viewDidLoad()")
            return
        }
        recipeView.updateData(recipe: recipeM)
        recipeView.labelDesc.numberOfLines = 10
        recipeView.labelDesc.lineBreakMode = .byWordWrapping
        initSubviews()
        // These views are here only to enable the app to create similar instances of these, this is why they are hidden
        lblIngredient0.isHidden = true
        lblTitleStep0.isHidden = true
        lblStep0.isHidden = true
        
        scrollView.contentSize = CGSize(
            width: scrollView.frame.size.width,
            height: vContainer.subviews.reduce(0) { max($0, $1.frame.maxY) }
        )
        let topConstraint = NSLayoutConstraint(item: ingredientsContainer, attribute: .top, relatedBy: .equal, toItem: vContainer, attribute: .top, multiplier: 1, constant: (recipeView.superview?.frame.size.height)!)
        ingredientsContainer.superview?.addConstraint(topConstraint)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var totalHeight: CGFloat = 0
        for view in scrollView.subviews {
            totalHeight += view.frame.height
        }
//        scrollView.contentSize = CGSize(width: view.frame.width, height: totalHeight)
    }

    func initSubviews() {
        var counter = 1
        for subview in self.ratingContainer.subviews {
            (subview as! UIButton).addTarget(
                self,
                action: #selector(handleRating),
                for: .touchUpInside)
            counter += 1
        }
        self.recipeModel?.ingredients.forEach{ ingredient in
            let lbl: UILabel = UILabel()
            lbl.textColor = lblIngredient0.textColor
            lbl.font = lblIngredient0.font
            lbl.frame = lblIngredient0.frame
            lbl.text = "  • \(ingredient.name) : \(ingredient.amount)"
            ingredientsContainer.addArrangedSubview(lbl)
        }
        var stepNum = 1
        self.recipeModel?.steps.forEach{ step in
            let lblTitle: UILabel = UILabel()
            lblTitle.textColor = lblTitleStep0.textColor
            lblTitle.font = lblTitleStep0.font
            lblTitle.frame = lblTitleStep0.frame
            lblTitle.text = " Etape \(stepNum) (\(step.duration) min)"
            stepsContainer.addArrangedSubview(lblTitle)
            stepNum += 1
            
            let lbl: UILabel = UILabel()
            lbl.textColor = lblStep0.textColor
            lbl.font = lblStep0.font
            lbl.frame = lblStep0.frame
            lbl.text = "  • \(step.description)"
            
            stepsContainer.addArrangedSubview(lbl)
        }
        var totalHeight: CGFloat = 0
        for subview in vContainer.subviews {
            totalHeight += subview.frame.height
        }
    }
    
    @objc func handleRating(_ sender: UIButton, _ rating: RatingModel.RawValue) {
        currentRating = sender.tag
        let starFill = UIImage(systemName: "star.fill")
        let starColor = ratingContainer.subviews[0].tintColor
        
        for i in 0 ..< currentRating {
            UIView.animate(withDuration: 0.2, delay: 0, animations: {
                self.ratingContainer.subviews[i].transform = CGAffineTransform(translationX: 0, y: -10)
            }, completion: {_ in
                UIView.animate(withDuration: 0.2, delay: 0, animations: {
                    self.ratingContainer.subviews[i].transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: nil)
            })
            (self.ratingContainer.subviews[i] as! UIButton).setBackgroundImage(starFill, for: .normal)
            (self.ratingContainer.subviews[i] as! UIButton).tintColor = starColor
            Task {
                await Database.editRecipeRating(recipe: recipeModel!, newRating: currentRating);
                print("Notation mise à jour")
            }
        }
        
        let starEmpty = UIImage(systemName: "star")
        if (currentRating < RatingModel.five.rawValue) {
            for i in currentRating ..< RatingModel.five.rawValue {
                (self.ratingContainer.subviews[i] as! UIButton).setBackgroundImage(starEmpty, for: .normal)
                (self.ratingContainer.subviews[i] as! UIButton).tintColor = starColor
            }
        }
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
