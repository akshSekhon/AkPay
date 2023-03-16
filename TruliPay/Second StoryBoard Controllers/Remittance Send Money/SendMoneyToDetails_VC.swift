//
//  SendMoneyToDetails_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit
import iOSDropDown
class SendMoneyToDetails_VC: UIViewController {

//    @IBOutlet weak var networkSelectTxtF: TextFieldWithPadding!
//    @IBOutlet weak var contrySelectTxtF: TextFieldWithPadding!
//    @IBOutlet weak var paymentModesTxtF: TextFieldWithPadding!
    @IBOutlet weak var txtFld_Network: DropDown!
    @IBOutlet weak var txtFld_Country: DropDown!
    @IBOutlet weak var txtFld_PaymentMode: DropDown!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var one_Label: UILabel!
    @IBOutlet weak var two_Label: UIView!
    @IBOutlet weak var three_Label: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        setUi()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "")

    }
    
    func setActions(){
        
        self.nextButton.actionBlock {
            self.pushOnly(Controllers.SendingMoneyReciversDetail_VC)
        }
    }

    func setUi(){
        setRoundCorners(view: one_Label)
        setRoundCorners(view: two_Label)
        setRoundCorners(view: three_Label)
        setRoundCorners(view: nextButton)
        two_Label.clipsToBounds = false
        three_Label.clipsToBounds = false
        
//        networkSelectTxtF.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
//        contrySelectTxtF.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
//        paymentModesTxtF.setRightViewIcon(VC: self, icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
        
        
        txtFld_Network.isSearchEnable = false
        txtFld_Country.isSearchEnable = false
        txtFld_PaymentMode.isSearchEnable = false
       
        
        txtFld_Network.setLeftPaddingPoints(20)
        txtFld_Country.setLeftPaddingPoints(20)
        txtFld_PaymentMode.setLeftPaddingPoints(20)
        
        
        txtFld_Network.optionArray = ARRAY_Network
        txtFld_Country.optionArray = ARRAY_CountryName
        txtFld_PaymentMode.optionArray = ARRAY_PaymentMode
       
        //Setting Dropdown Actions
        
        // For  txtFld_Network
        txtFld_Network.didSelect{(selectedText , index ,id) in

           self.txtFld_Network.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_Network.listWillDisappear {
           self.txtFld_Network.resignFirstResponder()
       }
        
        // For  txtFld_Country
        txtFld_Country.didSelect{(selectedText , index ,id) in

           self.txtFld_Country.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_Country.listWillDisappear {
           self.txtFld_Country.resignFirstResponder()
       }
        
        // For  txtFld_PaymentMode
        txtFld_PaymentMode.didSelect{(selectedText , index ,id) in

           self.txtFld_PaymentMode.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_PaymentMode.listWillDisappear {
           self.txtFld_PaymentMode.resignFirstResponder()
       }
    }
    @objc func dropDownButton() {
print(" Button Clicked")
        // Add your code here to handle button.
//        ,buttonAction: #selector(dropDownButton)
    }
}
