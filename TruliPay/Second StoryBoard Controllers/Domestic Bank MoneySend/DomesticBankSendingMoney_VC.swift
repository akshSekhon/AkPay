//
//  SendingMoneyToDomesticBank_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class DomesticBankSendingMoney_VC: UIViewController {

    @IBOutlet weak var view_sendViaUniqueID: UIView!
    @IBOutlet weak var searchField_BaseView: UIView!
    @IBOutlet weak var trasferPurpose_TextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var uinqueIdTextField: TextFieldWithPadding!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUi()
        setActions()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Send Money")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        trasferPurpose_TextView.becomeFirstResponder()
        trasferPurpose_TextView.resignFirstResponder()
    }
    func setActions(){
        self.sendButton.actionBlock {
            self.pushOnly(Controllers.DomesticMPIN_VC)
        }
        self.view_sendViaUniqueID.actionBlock {
            self.pushOnly(Controllers.OtherWalletSendMoneyTo_EnterAmount_VC)
        }
    }
    func setUi(){
        uinqueIdTextField.setRightViewIcon(VC: self, icon: UIImage(named: Images.RightArrow)!,buttonAction: #selector(dropDownButton))
        trasferPurpose_TextView.delegate = self
        trasferPurpose_TextView.textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        
        trasferPurpose_TextView.text = "Purpose of transfer"
        trasferPurpose_TextView.textColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
    }
    @objc func dropDownButton() {
print(" Button Clicked")
        // Add your code here to handle button.
//        ,buttonAction: #selector(dropDownButton)
    }
}

extension DomesticBankSendingMoney_VC:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Purpose of transfer" {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Purpose of transfer"
            textView.textColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
        }
    }
}
