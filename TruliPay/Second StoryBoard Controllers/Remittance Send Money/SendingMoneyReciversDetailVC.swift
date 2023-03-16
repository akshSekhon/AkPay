//
//  SendingMoneyReciversDetailVC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit
import iOSDropDown
class SendingMoneyReciversDetail_VC: UIViewController {

    @IBOutlet weak var txtFld_SelectNetwork: DropDown!
    @IBOutlet weak var txtFld_SelectCountry: DropDown!
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
            self.pushOnly(Controllers.SendMoneyAmmount_VC)
        }
    }
    func setUi(){
        setRoundCorners(view: one_Label)
        setRoundCorners(view: two_Label)
        setRoundCorners(view: three_Label)
        setRoundCorners(view: nextButton)
        two_Label.clipsToBounds = false
        three_Label.clipsToBounds = false
        
        txtFld_SelectNetwork.isSearchEnable = false
        txtFld_SelectCountry.isSearchEnable = false
        txtFld_PaymentMode.isSearchEnable = false
       
        
        txtFld_SelectNetwork.setLeftPaddingPoints(20)
        txtFld_SelectCountry.setLeftPaddingPoints(20)
        txtFld_PaymentMode.setLeftPaddingPoints(20)
        
        
        txtFld_SelectNetwork.optionArray = ARRAY_Network
        txtFld_SelectCountry.optionArray = ARRAY_CountryName
        txtFld_PaymentMode.optionArray = ARRAY_PaymentMode
       
        //Setting Dropdown Actions
        
        // For  txtFld_Network
        txtFld_SelectNetwork.didSelect{(selectedText , index ,id) in

           self.txtFld_SelectNetwork.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_SelectNetwork.listWillDisappear {
           self.txtFld_SelectNetwork.resignFirstResponder()
       }
        
        // For  txtFld_Country
        txtFld_SelectCountry.didSelect{(selectedText , index ,id) in

           self.txtFld_SelectCountry.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_SelectCountry.listWillDisappear {
           self.txtFld_SelectCountry.resignFirstResponder()
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
}
