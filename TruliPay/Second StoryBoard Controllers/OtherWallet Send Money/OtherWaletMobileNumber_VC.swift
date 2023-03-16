//
//  OtherWaletMobileNumber_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit
import ContactsUI

class OtherWaletMobileNumber_VC: UIViewController {

    @IBOutlet weak var mobileNumTextField: TextFieldWithPadding!
    @IBOutlet weak var nextButton: UIButton!
    
    var textFieldText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        mobileNumTextField.isUserInteractionEnabled = false
        setAction()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Send Money")
        mobileNumTextField.setRightViewIcon(VC: self, icon: UIImage(named: Images.addContact)!,buttonAction: #selector(dropDownButton))
    }
    @objc func dropDownButton() {
        print(" Button Clicked")
        mobileNumTextField.isUserInteractionEnabled = true
        showContacts()

        // Add your code here to handle button.
//        ,buttonAction: #selector(dropDownButton)
    }
    
    func setAction(){
        nextButton.actionBlock {
            self.pushOnly(Controllers.OtherWalletSellectedContact_VC)
        }
    }
    
    @IBAction func keyPadButtons(_ sender: UIButton) {
        if sender.tag < 10 {
           
            textFieldText.append("\(sender.tag )")
           
        }
        else{
            guard textFieldText != "" else{return}
            textFieldText.removeLast()
        }
        mobileNumTextField.text = textFieldText
    }
    
}
extension OtherWaletMobileNumber_VC: CNContactPickerDelegate{
    
    func showContacts(){
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        contactPicker.displayedPropertyKeys =
            [CNContactGivenNameKey
                , CNContactPhoneNumbersKey]
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    
    func contactPicker(_ picker: CNContactPickerViewController,
                       didSelect contactProperty: CNContactProperty) {
        
        print("good Working")

    }

    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        // You can fetch selected name and number in the following way

        // user name
        let userName:String = contact.givenName

        // user phone number
        let userPhoneNumbers:[CNLabeledValue<CNPhoneNumber>] = contact.phoneNumbers
        let firstPhoneNumber:CNPhoneNumber = userPhoneNumbers[0].value


        // user phone number string
        let primaryPhoneNumberStr:String = firstPhoneNumber.stringValue
   print(userName)
        print(primaryPhoneNumberStr)
        print("good Working")
    }

    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
   print("View Will disappear")
    }
   }

