//
//  SendMoneyToOtherWallet_EnterAmount_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class OtherWalletSendMoneyTo_EnterAmount_VC: UIViewController {

    @IBOutlet weak var sendingToImageView: UIImageView!
    @IBOutlet weak var sendingToNameLbl: UILabel!
    @IBOutlet weak var sendingToNumberLbl: UILabel!
    @IBOutlet weak var amontTextField: TextFieldWithPadding!
    @IBOutlet weak var tranferPurposeTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tranferPurposeTextView.textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        tranferPurposeTextView.delegate = self
        setActions()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Send Money")

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUi()
    }

    func setUi(){
        setRoundCorners(view: sendingToImageView)
        tranferPurposeTextView.text = "Purpose of transfer"
        tranferPurposeTextView.textColor = UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1)
    }
    func setActions(){
        sendButton.actionBlock {
            self.pushOnly(Controllers.DomesticMPIN_VC)
        }
    }

}
extension OtherWalletSendMoneyTo_EnterAmount_VC:UITextViewDelegate{
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
