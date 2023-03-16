//
//  CompleteProfile_VC.swift
//  TruliPay
//
//  Created by Mobile on 08/04/22.
//

import UIKit
import iOSDropDown
class CompleteProfile_VC: UIViewController, UITextFieldDelegate {

    let datePicker = UIDatePicker()
    
    @IBOutlet weak var txtFld_gender: DropDown!
 //   @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var firstNameTxtField: TextFieldWithPadding!
    @IBOutlet weak var dobTextField: PickerTextField!
    @IBOutlet weak var one_Label: UIView!
    @IBOutlet weak var two_Label: UIView!
    @IBOutlet weak var three_Label: UIView!
    @IBOutlet weak var nextButton: UIButton!
    var dropDownGender = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()
//        dobTextField.tintColor = .clear
        
        setActions()
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
        dobTextField.delegate = self
        firstNameTxtField.delegate = self
        addInputViewDatePicker(field: dobTextField)
        
       
      
        
//        genderTextField = DropDown()
        txtFld_gender.isUserInteractionEnabled = true
        txtFld_gender.isSearchEnable = false
     //   dropDownGender = genderTextField as! DropDown
      
        txtFld_gender.optionArray = ARRAY_Gender
        txtFld_gender.setLeftPaddingPoints(20)
        
      //  genderTextField.setRightViewIcon(VC: self,icon: UIImage(named: Images.Dropdown)!,buttonAction: #selector(dropDownButton))
        dobTextField.setRightViewIcon(VC: self,icon: UIImage(named: Images.dobCalander)!,buttonAction: #selector(dropDownButton))
    setRoundCorners(view: nextButton)
     setRoundCorners(view: one_Label)
        setRoundCorners(view: two_Label)
        setRoundCorners(view: three_Label)
        two_Label.clipsToBounds = false
        three_Label.clipsToBounds = false
       
        txtFld_gender.didSelect{(selectedText , index ,id) in
//        self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
           self.txtFld_gender.text = selectedText
           print("selected item in dropdown = ",selectedText)
       }
        txtFld_gender.listWillDisappear {
           self.txtFld_gender.resignFirstResponder()
       }
    }
    //MARK: - button actions
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        
    }
    @objc func dropDownButton() {
        dobTextField.becomeFirstResponder()
        
      
    }
 
    func setActions(){
        self.nextButton.actionBlock {
            self.pushOnly(Controllers.CompleteProfile_addressVC)
        }
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == firstNameTxtField{
//            textField.tintColor = .clear
            print ("nlfrg;lekrw")
            return false
        }
        else{
            return true
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   


}
//MARK: -DatePicker
extension CompleteProfile_VC {
    
    func addInputViewDatePicker(field: UITextField,pickerHidden: Bool = false) {
        //Add DatePicker as inputView
        
        datePicker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 216)
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
  
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            print("wheel Picker not found")
        }
        field.inputView = datePicker
        datePicker.isHidden = pickerHidden
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
//        toolBar.tintColor = UIColor.sy 1)
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self , action: #selector(doneButtonPressed))
        toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
        
        toolBar.sizeToFit()
        field.inputAccessoryView = toolBar
        
    }
    @objc func doneButtonPressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dobTextField.text = dateFormatter.string(from: datePicker.date)
        print(dobTextField.text as Any)
        dobTextField.resignFirstResponder()
    }
    @objc func cancelButtonPressed(){
        dobTextField.resignFirstResponder()
    }
}
