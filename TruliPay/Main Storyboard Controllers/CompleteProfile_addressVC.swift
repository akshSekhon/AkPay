//
//  CompleteProfile_addressVC.swift
//  TruliPay
//
//  Created by Mobile on 08/04/22.
//

import UIKit
import iOSDropDown
class CompleteProfile_addressVC: UIViewController {

    @IBOutlet weak var one_Label: UILabel!
    @IBOutlet weak var two_Label: UIView!
    @IBOutlet weak var three_Label: UIView!
    @IBOutlet weak var nextButton: UIButton!
//    @IBOutlet weak var three_Label: UIView!
    
    @IBOutlet weak var txtFld_ResidentialAddressCountry: DropDown!
    @IBOutlet weak var txtFld_ResidentialAddressState: DropDown!
  
    @IBOutlet weak var txtFld_BillingAddressCountry: DropDown!
    @IBOutlet weak var txtFld_BillingAddressState: DropDown!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
//        navigationController?.isNavigationBarHidden = false
//        title = "Complete Profile"
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//        
//        let leftBtn = UIBarButtonItem(image:UIImage(named: "left_arrow"), style: .plain, target: self, action: #selector(backBtnClicked))
//        self.navigationItem.leftBarButtonItem = leftBtn
//        navigationController?.navigationBar.tintColor = UIColor.black
        // Do any additional setup after loading the view.
        addActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(vc: self, middleTitle: "Complete Profile")
        self.viewDidLayoutSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUi()
    }
    func setUi(){
//        refidentialCountry_TextField.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
//        refidentialState_TextField.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
//        billingCountry_TextField.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
//        billingState_TextField.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
        
        
        txtFld_ResidentialAddressCountry.isSearchEnable = false
        txtFld_ResidentialAddressState.isSearchEnable = false
        txtFld_BillingAddressCountry.isSearchEnable = false
        txtFld_BillingAddressState.isSearchEnable = false
        
        txtFld_ResidentialAddressCountry.setLeftPaddingPoints(20)
        txtFld_ResidentialAddressState.setLeftPaddingPoints(20)
        txtFld_BillingAddressCountry.setLeftPaddingPoints(20)
        txtFld_BillingAddressState.setLeftPaddingPoints(20)
        
        txtFld_ResidentialAddressCountry.optionArray = ARRAY_CountryName
        txtFld_ResidentialAddressState.optionArray = ARRAY_StateName
        txtFld_BillingAddressCountry.optionArray = ARRAY_CountryName
        txtFld_BillingAddressState.optionArray = ARRAY_StateName
        
    setRoundCorners(view: nextButton)
     setRoundCorners(view: one_Label)
     setRoundCorners(view: two_Label)
       setRoundCorners(view: three_Label)
        three_Label.clipsToBounds = false
        
        
        
        //Setting Dropdown Actions
        
    // For ResidentialAddressCountry
        txtFld_ResidentialAddressCountry.didSelect{(selectedText , index ,id) in

           self.txtFld_ResidentialAddressCountry.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_ResidentialAddressCountry.listWillDisappear {
           self.txtFld_ResidentialAddressCountry.resignFirstResponder()
       }
        
        // For txtFld_ResidentialAddressState
        txtFld_ResidentialAddressState.didSelect{(selectedText , index ,id) in

           self.txtFld_ResidentialAddressState.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_ResidentialAddressState.listWillDisappear {
           self.txtFld_ResidentialAddressState.resignFirstResponder()
       }
        
        // For txtFld_ResidentialAddressState
        txtFld_ResidentialAddressState.didSelect{(selectedText , index ,id) in

           self.txtFld_ResidentialAddressState.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_ResidentialAddressState.listWillDisappear {
           self.txtFld_ResidentialAddressState.resignFirstResponder()
       }
        
        //For txtFld_BillingAddressCountry
        txtFld_BillingAddressCountry.didSelect{(selectedText , index ,id) in

           self.txtFld_BillingAddressCountry.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_BillingAddressCountry.listWillDisappear {
           self.txtFld_BillingAddressCountry.resignFirstResponder()
       }
        
        // For txtFld_BillingAddressState
        txtFld_BillingAddressState.didSelect{(selectedText , index ,id) in

           self.txtFld_BillingAddressState.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_BillingAddressState.listWillDisappear {
           self.txtFld_BillingAddressState.resignFirstResponder()
       }
    }
    @objc func backBtnClicked(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func dropDownButton() {
print(" Button Clicked")
        // Add your code here to handle button.
//        ,buttonAction: #selector(dropDownButton)
    }
    
    
    func addActions(){
        self.nextButton.actionBlock {
            self.pushOnly(Controllers.CompleteProfile_mpinVC)
        }
        
    }
}


//0.176056
