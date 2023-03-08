//
//  ImageFactory.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 29/01/2023.
//

import Foundation
import UIKit

class ImageFactory {
    
    class func getFromUrl(url: URL, callBack: @escaping (Data?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil, let d = data else {
                callBack(nil, error)
                return
            }
            
            callBack(d, nil)
        }
        task.resume()
    }
}
