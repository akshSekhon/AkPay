//
//  ForgotMPIN_VC.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit
class ForgotMPIN_VC: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setAactions()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Reset MPIN")

    }
    func setAactions(){
        
        submitBtn.actionBlock {
            self.pushOnly(Controllers.Login_VC)
        }
    }
   
}
