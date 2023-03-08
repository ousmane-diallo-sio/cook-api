//
//  StepTableViewCell.swift
//  CookAPI
//
//  Created by Jean on 07/03/2023.
//

import UIKit

class StepTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var StepNameLabel: UILabel!
    @IBOutlet weak var ButtonSupp: UIButton!
    
    func redraw() {
        self.StepNameLabel.text = "test"
    }
}
