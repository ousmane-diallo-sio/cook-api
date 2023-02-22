//
//  EditRecipeViewController.swift
//  CookAPI
//
//  Created by Jean on 09/02/2023.
//

import UIKit

class EditRecipeViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var ImageVueUpload: UIImageView!
    
    @IBOutlet weak var ChooseImageButton: UIButton!
    
    @IBAction func ChooseImageButton(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Source photo", message: "choississer une source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "camera", style: .default, handler: {(action:UIAlertAction) in imagePickerController.sourceType = .camera
            self.present(imagePickerController,animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "galerie photo", style: .default, handler: {(action:UIAlertAction)in imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "annuler", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true,completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        ImageVueUpload.image = image
        
        picker.dismiss(animated: true,completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true,completion: nil)
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
