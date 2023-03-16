//
//  ContactFeching.swift
//  TruliPay
//
//  Created by Mobile on 20/04/22.
//

import Foundation
import UIKit


/*
import UIKit
import ContactsUI
extension OtherWaletMobileNumber_VC: UIViewController,CNContactPickerDelegate{

    var contacts = [CNContact]()
    var names = [Any]()
    var numbr = [Any]()
    let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                    CNContactPhoneNumbersKey,
                    CNContactEmailAddressesKey
            ] as [Any]
     
     let contactStore = CNContactStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
        //        Helper.showToast("Message")
       
    }
    
    @IBAction func ftchBtn(_ sender: UIButton) {
        myview.vu.showToast("Please Wait ")
        
        showContacts()
        

    }
    
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





/*
 class ViewController: UIViewController,CNContactPickerDelegate{

     var contacts = [CNContact]()
     var names = [Any]()
     var numbr = [Any]()
     let keys = [
             CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                     CNContactPhoneNumbersKey,
                     CNContactEmailAddressesKey
             ] as [Any]
      
      let contactStore = CNContactStore()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
     }
     @IBAction func ftchBtn(_ sender: UIButton) {
         
         let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
         do {
             try contactStore.enumerateContacts(with: request){
                 (contact, stop) in
                 // Array containing all unified contacts from everywhere
                 self.contacts.append(contact)
                 for phoneNumber in contact.phoneNumbers {
                     if let number = phoneNumber.value as? CNPhoneNumber, let label = phoneNumber.label {
                         let localizedLabel = CNLabeledValue<CNPhoneNumber>.localizedString(forLabel: label)
 //                        print("\(contact.givenName) \(contact.familyName) tel:\(localizedLabel) -- \(number.stringValue), email: \(contact.emailAddresses)")
                         
                         self.names.append(contact.givenName)
                         self.numbr.append(number.stringValue)
                     }
                 }
             }
             print(contacts[6])
      }
      catch {
          print("unable to fetch contacts")
      }
         
 //      print("My Contacts are : \(names)\n\(numbr)")
 //        print("My Number are : \(numbr)\n")
     }
     }
*/

*/
