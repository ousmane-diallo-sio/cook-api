//
//  ImageFactory.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 29/01/2023.
//

import Foundation
import UIKit

class ImageFactory {
    
    class func getFromUrl(url: URL) -> UIImage? {
        // Modifier la fonction et faire un appel asynchrone
        let imgData = try? Data(contentsOf: url)

        if let imageData = imgData {
            return UIImage(data: imageData)
        }
        return nil
    }
    
}
