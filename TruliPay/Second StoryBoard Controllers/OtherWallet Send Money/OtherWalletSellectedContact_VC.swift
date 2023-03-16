//
//  OtherWalletSellectedContact_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class OtherWalletSellectedContact_VC: UIViewController {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLbl: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Send Money")

    }
    func setActions(){
        nextButton.actionBlock {
            self.pushOnly(Controllers.OtherWalletSendMoneyTo_EnterAmount_VC)
        }
    }
}
