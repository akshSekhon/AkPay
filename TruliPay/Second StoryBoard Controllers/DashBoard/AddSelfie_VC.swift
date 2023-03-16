//
//  AddSelfie_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class AddSelfie_VC: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var selfieImageView: UIView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var newPicButton: UIButton!
    
    @IBOutlet weak var ImgVw_uploadedImage: UIImageView!
    
    var Image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setActions()
        // Do any additional setup after loading the view.
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "")
        guard let image = dataFromLastVC as? UIImage else {return}
        ImgVw_uploadedImage.image = image
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async {
            self.setUI()
        }
       
    }
    
    func setUI(){
        setRoundCorners(view: ImgVw_uploadedImage)
        ImgVw_uploadedImage.layer.masksToBounds = true
        setRoundCorners(view: clearButton)
        setRoundCorners(view: newPicButton)
//        ImgVw_uploadedImage.makeRounded()
        
    }
    func setActions(){
        clearButton.actionBlock {
            print("My Selfie Clear Button Press")
            self.popOnly()
        }
        newPicButton.actionBlock {
            print("Take new button press")
            self.openPicker()
        }
        
    }
    func openPicker(){
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
              alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                  self.openCamera()
              }))

              alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                  self.openGallery()
              }))

              alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

              self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    //MARK:-- ImagePicker delegate
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            // imageViewPic.contentMode = .scaleToFill
            Image = pickedImage
            ImgVw_uploadedImage.image = Image
        }
//            picker.dismiss(animated: true) {
//                if self.Image != nil{
//                 //   pushOnly(Controllers.AddSelfie_VC)
//                    self.pushWithData(Controllers.AddSelfie_VC, self.Image)
//
//                }else{
//
//                }
//            }
            picker.dismiss(animated: true, completion: nil)
    }
}

extension UIImageView {

    func makeRounded() {

        let radius = self.frame.width / 2
             self.layer.cornerRadius = radius
             self.layer.masksToBounds = true
    }
}
