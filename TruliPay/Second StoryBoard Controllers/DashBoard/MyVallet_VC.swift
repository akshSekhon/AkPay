//
//  MyVallet_VC.swift
//  TruliPay
//
//  Created by Mobile on 12/04/22.
//

import UIKit

class MyVallet_VC: UIViewController {

    @IBOutlet weak var payBtnView: UIView!
    @IBOutlet weak var trasferToBankBtnView: UIView!
    @IBOutlet weak var reciveMoneyBtnView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "My Wallet")

    }

    func setActions(){
        payBtnView.actionBlock {
            self.payBtnView.flash(numberOfFlashes: 1)
            DispatchQueue.main.async {
                self.pushOnly(Controllers.SendMoneyMethodsViewController)

            }
        }
        
        trasferToBankBtnView.actionBlock {
            self.trasferToBankBtnView.flash(numberOfFlashes: 1)
            DispatchQueue.main.async {
                self.pushOnly(Controllers.DomesticBankSendingMoney_VC)

            }
        }
        reciveMoneyBtnView.actionBlock {
            DispatchQueue.main.async {
                self.pushOnly(Controllers.RecivedMoneyMyVallet_Vc)
            }
            self.reciveMoneyBtnView.flash(numberOfFlashes: 1)
        }
    }
    
   

}
extension UIView {
        func flash(numberOfFlashes: Float) {
           let flash = CABasicAnimation(keyPath: "opacity")
           flash.duration = 0.2
           flash.fromValue = 1
           flash.toValue = 0.2
           flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
           flash.autoreverses = true
           flash.repeatCount = numberOfFlashes
           layer.add(flash, forKey: nil)
       }
 }
