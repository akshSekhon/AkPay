//
//  MasterCard_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class MasterCard_VC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var masterCardImageView: UIView!
    @IBOutlet weak var getCardButton: UIButton!
    @IBOutlet weak var enterCVVTextField: UITextField!
    @IBOutlet weak var bankAccountNumberLabel: UILabel!
    @IBOutlet weak var bankCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAction()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Master card",rightimg: UIImage(named: Images.threeDot)!,rightAction: #selector(barRightBtnAction))

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUi()
    }
    
    @objc func barRightBtnAction(){
        let actionSheetAlertController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let doneBtn = UIAlertAction(title:  "Done", style: .cancel, handler: nil)
        actionSheetAlertController.addAction(doneBtn)
        
        let suspendBtn = UIAlertAction(title: "Suspend/Block card", style: .default, handler: nil)
        suspendBtn.setValue(UIImage(), forKey: "image")
        suspendBtn.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        actionSheetAlertController.addAction(suspendBtn)
        
        let reActiveCardBtn = UIAlertAction(title: "Re-Activate card", style: .default, handler: nil)
        actionSheetAlertController.addAction(reActiveCardBtn)
        reActiveCardBtn.setValue(UIImage(), forKey: "image")
        reActiveCardBtn.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

        let setCardPinBtn = UIAlertAction(title: "Set card Pin", style: .default, handler: nil)
        actionSheetAlertController.addAction(setCardPinBtn)
        setCardPinBtn.setValue(UIImage(), forKey: "image")
        setCardPinBtn.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let resetCardPinBtn = UIAlertAction(title: "Re-set card Pin", style: .default, handler: nil)
        actionSheetAlertController.addAction(resetCardPinBtn)
        resetCardPinBtn.setValue(UIImage(), forKey: "image")
        resetCardPinBtn.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")

        
        if let firstSubview = actionSheetAlertController.view.subviews.first, let alertContentView = firstSubview.subviews.first {
            for view in alertContentView.subviews {
                view.backgroundColor = .white
            }
        }

       
       
//        
//        actionSheetAlertController.view.backgroundColor = .white
        actionSheetAlertController.view.tintColor = UIColor.black
        
        self.present(actionSheetAlertController, animated: true, completion: nil)
    }
    
    func setUi(){
        let topColor = UIColor(red: 48/255, green: 31/255, blue: 160/255, alpha: 1)
        let bottomColor = UIColor(red: 0/255, green: 119/255, blue: 249/255, alpha: 1)
        setRoundCorners(view: getCardButton)
        masterCardImageView.gradientViewtopToBottom(topColor, bottomColor)
        enterCVVTextField.delegate = self
    }
    
    func setAction(){
        getCardButton.actionBlock {
            self.pushOnly(Controllers.ConfirmAddress_VC)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == enterCVVTextField{
            let maxLength = 3
                let currentString: NSString = (textField.text ?? "") as NSString
                let newString: NSString =
                    currentString.replacingCharacters(in: range, with: string) as NSString
                return newString.length <= maxLength
        }else {
            return true
        }
    }
}
