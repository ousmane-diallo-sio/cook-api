//
//  RecipeTableViewCell.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 13/01/2023.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var ivProfilePic: UIImageView!
    @IBOutlet weak var vRatingContainer: UIView!
    
    func redraw(recipe: RecipeModel) {
        labelTitle.text = recipe.title
        labelDesc.text = recipe.desc
        labelUsername.text = recipe.author.username
        for i in 0 ..< vRatingContainer.subviews.count {
            if (recipe.rating.rawValue > i) {
                (vRatingContainer.subviews[i] as UIView).tintColor = UIColor.yellow
            }
        }
        
        guard let img = ImageFactory.getFromUrl(url: URL(string: recipe.imgUrl)!),
              let imgProfile = ImageFactory.getFromUrl(url: URL(string: recipe.author.picture)!) else {
            return
        }
        self.ivImage.image = img
        self.ivProfilePic.image = imgProfile
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
