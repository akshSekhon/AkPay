//
//  UpdateKYC_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit
import iOSDropDown
class UpdateKYC_VC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var txtFld_SelectID: DropDown!
  //  @IBOutlet weak var selectIdTxtF: TextFieldWithPadding!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var imgView_Checked: UIImageView!
    @IBOutlet weak var view_AddSelfie: CustomDashedView!
    @IBOutlet weak var view_Browse: CustomDashedView!
    var checked = false
    var cameraOn = false
    var Image : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        setUi()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Complete KYC")
        

    }
    func setUi(){
      //  selectIdTxtF.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!, buttonAction: #selector(textFieldBtnAction))
        
        txtFld_SelectID.isSearchEnable = false
        txtFld_SelectID.setLeftPaddingPoints(20)
        txtFld_SelectID.optionArray = ARRAY_SelectID
        // For  txtFld_SelectID
        txtFld_SelectID.didSelect{(selectedText , index ,id) in

           self.txtFld_SelectID.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_SelectID.listWillDisappear {
           self.txtFld_SelectID.resignFirstResponder()
       }
    }
    
    @objc func textFieldBtnAction(){
    print("button click")
    }
    
    func setActions(){
        
        self.submitButton.actionBlock {
            self.popOnly()
        }
        imgView_Checked.actionBlock {
            if self.checked == false{
                self.imgView_Checked.backgroundColor = UIColor(red: 38/255, green: 116/255, blue: 255/255, alpha: 1)
                self.imgView_Checked.image = UIImage(systemName: "checkmark")
//                self.imgView_Checked.tintColor = .systemBackground checkmark.square.fill
                self.checked = true
            }else if self.checked == true{
                self.imgView_Checked.image = nil
                self.checked = false
                self.imgView_Checked.backgroundColor = .systemBackground
            }else {
                self.imgView_Checked.image = nil
                self.imgView_Checked.backgroundColor = .systemBackground
            }
        }
        view_AddSelfie.actionBlock {
            self.cameraOn = true
            self.openPicker()
        }
        view_Browse.actionBlock {
            self.cameraOn = false
            self.openGallery()
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
        }
            if cameraOn {
            picker.dismiss(animated: true) {
                if self.Image != nil{
                 //   pushOnly(Controllers.AddSelfie_VC)
                    self.pushWithData(Controllers.AddSelfie_VC, self.Image)
                    
                }else{
                   
                }
            }
            }
            else {
                picker.dismiss(animated: true,completion: nil)
            }
    }
}
