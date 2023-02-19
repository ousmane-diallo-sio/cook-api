//
//  EditRecipeViewController.swift
//  CookAPI
//
//  Created by Jean on 09/02/2023.
//

import UIKit

class EditRecipeViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var ImageVueUpload: UIImageView!
    var alertController: UIAlertController?
    
    @IBOutlet weak var ChooseImageButton: UIButton!
    var pickerController: UIImagePickerController?
    
    @IBAction func ChooseImageButton(sender: UIButton) {
        alertController = UIAlertController(title: "take image", message: "choose image source", preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "camera", style: .default){ (action) in
            print("you choose camera")
        }
        
    }
    
    func imageSelect(){
        pickerController = UIImagePickerController()
        if(UIImagePickerController.isSourceTypeAvailable(.camera)==false){
        return
    }
        pickerController?.delegate = self;
        pickerController?.allowsEditing = true;
        pickerController?.sourceType = .camera
        self.present(pickerController!,animated: true){
            print("presented camera")
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
