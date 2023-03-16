//
//  ConfirmAddress_VC.swift
//  TruliPay
//
//  Created by Mobile on 15/04/22.
//

import UIKit
import iOSDropDown

class ConfirmAddress_VC: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var txtFld_Country: DropDown!
    @IBOutlet weak var txtFld_State: DropDown!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        setUI()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Master card",leftAction: #selector(barLeftBtnAction))

    }
    @objc func barLeftBtnAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUI(){
        txtFld_Country.isSearchEnable = false
        txtFld_State.isSearchEnable = false
        
        txtFld_Country.setLeftPaddingPoints(20)
        txtFld_State.setLeftPaddingPoints(20)
        txtFld_Country.optionArray = ARRAY_CountryName
        txtFld_State.optionArray = ARRAY_StateName
        
        //Setting Dropdown Actions
        
    // For txtFld_Country
        txtFld_Country.didSelect{(selectedText , index ,id) in

           self.txtFld_Country.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_Country.listWillDisappear {
           self.txtFld_Country.resignFirstResponder()
       }
        
        // For txtFld_State
        txtFld_State.didSelect{(selectedText , index ,id) in

           self.txtFld_State.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_State.listWillDisappear {
           self.txtFld_State.resignFirstResponder()
       }
    }
    func setActions(){
        
        confirmBtn.actionBlock {
            self.navigationController?.popViewController(animated: true)
            
        }
    }
}
