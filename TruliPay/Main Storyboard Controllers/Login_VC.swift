 //
//  Login_VC.swift
//  TruliPay
//
//  Created by Mobile on 07/04/22.
//

import UIKit
import SKCountryPicker
class Login_VC: UIViewController {

    @IBOutlet weak var segmentControl: CustomSegmentedControl!
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryPick_Button: UIButton!
    
    @IBOutlet weak var mobilleNumber_TextField: UITextField!
    @IBOutlet weak var refrence_TextField: UITextField!
    @IBOutlet weak var requestOtp_Button: UIButton!
    @IBOutlet weak var login_Label: UIView!
    @IBOutlet weak var register_Label: UIView!
    
    @IBOutlet weak var numberFiels_View: UIView!
    @IBOutlet weak var referField_BaseView: UIView!
    @IBOutlet weak var privacyBtn_BaseView: UIView!
    
    var userTypeNew = false
    var newUserLogin = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        self.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
        mobilleNumber_TextField.setLeftPaddingPoints(5)
        mobilleNumber_TextField.placeholderColor(color: UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1))
        userTypeNew = false
        DispatchQueue.main.async {
            self.setUi()
        }
        
        self.viewDidLayoutSubviews()
       
        
        if newUserLogin == true {
            userTypeNew = true
            self.segmentControl.selectedSegmentIndex = 1
            referField_BaseView.isHidden = false
            privacyBtn_BaseView.isHidden = false
            login_Label.isHidden = false
            register_Label.isHidden = true
        }
        else{
            self.segmentControl.selectedSegmentIndex = 0
            referField_BaseView.isHidden = true
            privacyBtn_BaseView.isHidden = true
            login_Label.isHidden = true
            register_Label.isHidden = false
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
       
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
//        navigationController?.navigationItem.hidesBackButton = true
        super.viewWillDisappear(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
          }
    func setActions(){
        requestOtp_Button.actionBlock {
            
            if self.userTypeNew {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Controllers.MVC_VCController) as! MVC_VC
            vc.newUser = self.userTypeNew
            self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: Controllers.MVC_VCController) as! MVC_VC
                vc.newUser = self.userTypeNew
                self.navigationController?.pushViewController(vc, animated: true)
            }
            }
        
        countryPick_Button.actionBlock {
            let controller = self.presentCountryPickerScene()
            
            
//            self.presentCountryPickerScene(withSelectionControlEnabled: true)
            
    }
    }
    func setUi(){
        
       
        
//        self.setRoundCorners(view: mobilleNumber_TextField,boderClr: UIColor(named: "textField_BorderColor") ?? .lightGray,borderWidth: 1.8)
        self.setRoundCorners(view: refrence_TextField,boderClr: UIColor(named: AppColor.grayBorderColor) ?? .lightGray,borderWidth: 1.2)
        self.setRoundCorners(view: numberFiels_View,boderClr: UIColor(named: AppColor.grayBorderColor) ?? .lightGray,borderWidth: 1.2)
//        mobilleNumber_TextField.setLeftImage(imageName: "img")
        setRoundCorners(view: requestOtp_Button)
        
//        mobilleNumber_TextField.layoutIfNeeded()
        
    }
    @IBAction func SegmentContrlAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            print("register")
            userTypeNew = true
            referField_BaseView.isHidden = false
            privacyBtn_BaseView.isHidden = false
            login_Label.isHidden = false
            register_Label.isHidden = true
        
        }
        else{
            userTypeNew = false
            referField_BaseView.isHidden = true
            privacyBtn_BaseView.isHidden = true
            login_Label.isHidden = true
            register_Label.isHidden = false

        }
        
        
    }
    
    @IBAction func requestOtpBtnAction(_ sender: UIButton) {
//        self.pushOnly(Controllers.MVC_VCController)
//        self.pushWithData(Controllers.MVC_VCController, newUser)
       
       
    }
    
   
}
private extension Login_VC{
    
    
    func presentCountryPickerScene(withSelectionControlEnabled selectionControlEnabled: Bool = true) {
      if selectionControlEnabled == true {
        
            // Present country picker with `Section Control` enabled
            CountryPickerWithSectionViewController.presentController(on: self, configuration: { countryController in
                countryController.configuration.flagStyle = .circular
                countryController.configuration.isCountryFlagHidden = false
                countryController.configuration.isCountryDialHidden = false
                countryController.configuration.isnameLabelHidden = true
                countryController.favoriteCountriesLocaleIdentifiers = ["IN", "US"]

            }) { [weak self] country in
                
                guard let self = self else { return }
//                self.countryImageView.isHidden = false
                self.flagImage.image = country.flag
//                self.countryCodeButton.setTitle(country.dialingCode, for: .normal)
                self.mobilleNumber_TextField.text = country.dialingCode
            }
        
    }
}
}
