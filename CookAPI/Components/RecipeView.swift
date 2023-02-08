//
//  RecipeView.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 04/02/2023.
//

import UIKit

class RecipeView: UIView {
    
    static let id = "RecipeView"
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var ivProfilePic: UIImageView!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var vRatingContainer: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        
        let nib = UINib(nibName: RecipeView.id, bundle: nil)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                            UIView else {fatalError("Unable to convert nib")}

        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(view)
        
        self.ivProfilePic.layer.cornerRadius = self.ivProfilePic.frame.width / 2
        self.ivProfilePic.clipsToBounds = true
    }
    
    func updateData(recipe: RecipeModel) {
        labelTitle.text = recipe.title
        labelDesc.text = recipe.desc
        labelUsername.text = recipe.author.username
        for i in 0 ..< vRatingContainer.subviews.count {
            if (recipe.rating.rawValue > i) {
                (vRatingContainer.subviews[i] as UIView).tintColor = UIColor.yellow
            }
        }
        
        ImageFactory.getFromUrl(url: URL(string: recipe.imgUrl)!) { data, error in
            if (data != nil) {
                // Create instance of UIImage in the main thread
                DispatchQueue.main.async {
                    self.ivImage.image = UIImage(data: data!)
                }
            }
        }
        
        
        ImageFactory.getFromUrl(url: URL(string: recipe.author.picture)!) { data, error in
            if (data != nil) {
                DispatchQueue.main.async {
                    self.ivProfilePic.image = UIImage(data: data!)
                }
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
