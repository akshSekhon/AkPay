//
//  MVC_VC.swift
//  TruliPay
//
//  Created by Mobile on 07/04/22.
//

import UIKit

class MVC_VC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var otpTextFiels_0: SingleDigitField!
    @IBOutlet weak var otpTextFiels_1: SingleDigitField!
    @IBOutlet weak var otpTextFiels_2: SingleDigitField!
    @IBOutlet weak var otpTextFiels_3: SingleDigitField!
    @IBOutlet weak var reRequestButtton: UIButton!
    @IBOutlet weak var btn_verify: UIButton!
    @IBOutlet weak var imgView_Checked: UIImageView!
    
    var newUser:Bool = false
    var checked = false
    var forgetMpin = false
    override func viewDidLoad() {
        super.viewDidLoad()
           
        setupTextFiels()
//        otpTextFiels_0.becomeFirstResponder()
        self.viewDidLayoutSubviews()
        setActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(vc: self, middleTitle: "")
        
        DispatchQueue.main.async {
            self.setUi()
        }
        self.viewDidLayoutSubviews()
            
    }
    func setupTextFiels(){
        if #available(iOS 12.0, *) {
            otpTextFiels_0.textContentType = .oneTimeCode
        }
        //self.otpTextFiels_0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       // self.otpTextFiels_0.becomeFirstResponder()
        
        
//        otpTextFiels_0.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
//        otpTextFiels_1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
//        otpTextFiels_2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
//        otpTextFiels_3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
                
        otpTextFiels_0.delegate = self
        otpTextFiels_1.delegate = self
        otpTextFiels_2.delegate = self
        otpTextFiels_3.delegate = self
        
        [otpTextFiels_0,otpTextFiels_1,otpTextFiels_2,otpTextFiels_3].forEach {
                    $0?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
                }
                // make the firsDigitField the first responder
        otpTextFiels_0.isUserInteractionEnabled = true
      //  otpTextFiels_0.becomeFirstResponder()
    }
    @objc func editingChanged(_ textField: SingleDigitField) {
        // check if the deleteBackwards key was pressed
        if textField.pressedDelete {
            // reset its state
            textField.pressedDelete = false
            // if the field has text empty its content
            if textField.hasText {
                textField.text = ""
            } else {
                // otherwise switch the field, resign the first responder and activate the previous field and empty its contents
                switch textField {
                case otpTextFiels_1, otpTextFiels_2, otpTextFiels_3:
                    textField.resignFirstResponder()
                    textField.isUserInteractionEnabled = false
                    switch textField {
                    case otpTextFiels_1:
                        otpTextFiels_0.isUserInteractionEnabled = true
                        otpTextFiels_0.becomeFirstResponder()
                        otpTextFiels_0.text = ""
                    case otpTextFiels_2:
                        otpTextFiels_1.isUserInteractionEnabled = true
                        otpTextFiels_1.becomeFirstResponder()
                        otpTextFiels_1.text = ""
                    case otpTextFiels_3:
                        otpTextFiels_2.isUserInteractionEnabled = true
                        otpTextFiels_2.becomeFirstResponder()
                        otpTextFiels_2.text = ""
                    default:
                        break
                    }
                default: break
                }
            }
        }
        // make sure there is only one character and it is a number otherwise delete its contents
        guard textField.text?.count == 1, textField.text?.last?.isWholeNumber == true else {
            textField.text = ""
            return
        }
        // switch the textField, resign the first responder and make the next field active
        switch textField {
        case otpTextFiels_0, otpTextFiels_1, otpTextFiels_2:
            textField.resignFirstResponder()
            textField.isUserInteractionEnabled = false
            switch textField {
            case otpTextFiels_0:
                otpTextFiels_1.isUserInteractionEnabled = true
                otpTextFiels_1.becomeFirstResponder()
            case otpTextFiels_1:
                otpTextFiels_2.isUserInteractionEnabled = true
                otpTextFiels_2.becomeFirstResponder()
            case otpTextFiels_2:
                otpTextFiels_3.isUserInteractionEnabled = true
                otpTextFiels_3.becomeFirstResponder()
            default: break
            }
        case otpTextFiels_3:
            otpTextFiels_3.resignFirstResponder()
        default: break
        }
    }
    @objc func textFieldDidChange(textField: UITextField){
            let text = textField.text
            if  text?.count == 1 {
                switch textField{
                case otpTextFiels_0:
                    otpTextFiels_1.becomeFirstResponder()
                case otpTextFiels_1:
                    otpTextFiels_2.becomeFirstResponder()
                case otpTextFiels_2:
                    otpTextFiels_3.becomeFirstResponder()
                case otpTextFiels_3:
                    otpTextFiels_3.resignFirstResponder()
                default:
                    break
                }
            }
            if  text?.count == 0 {
                switch textField{
                case otpTextFiels_0:
                    otpTextFiels_0.becomeFirstResponder()
                case otpTextFiels_1:
                    otpTextFiels_0.becomeFirstResponder()
                case otpTextFiels_2:
                    otpTextFiels_1.becomeFirstResponder()
                case otpTextFiels_3:
                    otpTextFiels_2.becomeFirstResponder()
                default:
                    break
                }
            }
            else{

            }
        }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
        
    }

    func setUi(){
        self.setRoundCorners(view: reRequestButtton,boderClr: UIColor(named: AppColor.grayBorderColor) ?? .lightGray,borderWidth: 1.2)
        self.setRoundCorners(view: otpTextFiels_0)
        self.setRoundCorners(view: otpTextFiels_1)
        self.setRoundCorners(view: otpTextFiels_2)
        self.setRoundCorners(view: otpTextFiels_3)
        self.setRoundCorners(view: btn_verify)
        
//        mobilleNumber_TextField.layoutIfNeeded()
        
    }
    
   
    func textFieldDidChangeSelection(_ textField: UITextField) {
         // let text = textField.text
           if otpTextFiels_0.text?.count == 1 {
               otpTextFiels_1.becomeFirstResponder()
            }
            if otpTextFiels_1.text?.count == 1
           {
                otpTextFiels_2.becomeFirstResponder()
           }
            if otpTextFiels_2.text?.count == 1
           {
                otpTextFiels_3.becomeFirstResponder()
           }
        if otpTextFiels_3.text?.count == 1{
            textField.resignFirstResponder()
        }
   }
       
   
    //MARK:- TextField Delegate Methods
//       func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//           if (string.count==0) {
//               print("backspace tapped")
//               textField.text = ""
//               let previousTag = textField.tag - 1
//               if previousTag > -1 {
//                   let previousResponder = textField.superview?.viewWithTag(previousTag)
//                   previousResponder?.becomeFirstResponder()
//               }
//               return false
//           } else if (string.count==1 && textField.text!.count < 1) {
//               textField.text = string
//               return false
//           } else {
//               let nextTag = textField.tag + 1
//               var nextResponder = textField.superview?.viewWithTag(nextTag)
//               if (nextResponder == nil){
//                   nextResponder = textField.superview?.viewWithTag(1)
//               }
//               nextResponder?.becomeFirstResponder()
//               (nextResponder as? UITextField)!.text = string
//               if nextTag == 4 {
//                  // checkOtp()
//                   self.view.endEditing(true)
//               }
//               return false
//           }
//       }

    
 
 

    //MARK: - button actions
    
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        
    }
    func setActions(){
        btn_verify.actionBlock {
            if self.newUser == true{
            self.pushOnly(Controllers.CompleteProfile_VC)
            }
            else if self.forgetMpin == true{
            self.pushOnly(Controllers.ForgotMPIN_VC)
            }
            
            else {
                self.pushOnly(Controllers.MPINkeys_VC)
            }
        }
        imgView_Checked.actionBlock {
            if self.checked == false{
                self.imgView_Checked.image = UIImage(named: "in_your")
                self.checked = true
            }else if self.checked == true{
                self.imgView_Checked.image = nil
                self.checked = false
            }else {
                self.imgView_Checked.image = nil
            }
        }
    }
}
class SingleDigitField: UITextField {
    // create a boolean property to hold the deleteBackward info
    var pressedDelete = false
    // customize the text field as you wish
    override func willMove(toSuperview newSuperview: UIView?) {
        keyboardType = .numberPad
        textAlignment = .center
   //     backgroundColor = .blue
     //   isSecureTextEntry = true
        isUserInteractionEnabled = false
    }
    // hide cursor
    override func caretRect(for position: UITextPosition) -> CGRect { .zero }
    // hide selection
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] { [] }
    // disable copy paste
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool { false }
    // override deleteBackward method, set the property value to true and send an action for editingChanged
    override func deleteBackward() {
        pressedDelete = true
        sendActions(for: .editingChanged)
    }
}
