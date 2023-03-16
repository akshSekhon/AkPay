//
//  DomesticMPIN_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class DomesticMPIN_VC: UIViewController {
    
    @IBOutlet var secureImageFirst: UIImageView!
    @IBOutlet var secureImageSecond: UIImageView!
    @IBOutlet var secureImageThird: UIImageView!
    @IBOutlet var secureImageFourth: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    var paymentSucess:PaymentSucessPopup!
    
    var textFieldTextArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
            setActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "")

    }
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setRoundCorners(view: submitButton)

    
}
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnKeysActions(_ sender: UIButton) {
        print("Button Click is",sender.tag)
        
        if sender.tag < 10{
            
            if textFieldTextArr.count < 4{
            textFieldTextArr.append("\(sender.tag)")
               UpdateMPIN()
            }
            else{
            print ("Over Attempt")
            }
        }
        else{
            guard textFieldTextArr.count > 0 else {return}
            textFieldTextArr.removeLast()
            UpdateMPIN()
        }
    }
    func UpdateMPIN(){
        if textFieldTextArr.count == 0 {
            secureImageFirst.backgroundColor = .systemBackground
            secureImageSecond.backgroundColor = .systemBackground
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 1{
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = .systemBackground
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 2{
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 3{
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageThird.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 4 {
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageThird.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageFourth.backgroundColor = UIColor(named: AppColor.mainBleColor)
        }else {
            secureImageFirst.backgroundColor = .systemBackground
            secureImageSecond.backgroundColor = .systemBackground
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }
    
    
    }
    
    func setActions(){
        self.submitButton.actionBlock {
            addPaymentSucessPopUp()
            print("Button Clicked")
    }
        func addPaymentSucessPopUp() {
            paymentSucess = PaymentSucessPopup()
            paymentSucess.btn_Ok.actionBlock { [weak self] in
                    guard let self = self else { return }
                self.navigationController?.popToViewController(of: SendMoneyMethodsViewController.self, animated: true)
                self.paymentSucess.removeFromSuperview()
                   
                }
            self.paymentSucess.frame = (self.navigationController?.view.frame)!
            self.navigationController?.view.addSubview(self.paymentSucess)
        
    }
    }
}
