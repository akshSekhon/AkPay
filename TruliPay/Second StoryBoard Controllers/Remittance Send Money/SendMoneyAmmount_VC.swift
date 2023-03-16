//
//  SendMoneyAmmount_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class SendMoneyAmmount_VC: UIViewController {
    
    @IBOutlet weak var one_Label: UILabel!
    @IBOutlet weak var two_Label: UILabel!
    @IBOutlet weak var three_Label: UIView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var sendCurrency_BaseView: UIView!
    @IBOutlet weak var sendAmount_BaseView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        setUi()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "")

    }
    func setActions(){
        
        self.nextButton.actionBlock {
            self.pushOnly(Controllers.SendAmountMpin_VC)
        }
    }
    func setUi(){
        setRoundCorners(view: one_Label)
        setRoundCorners(view: two_Label)
        setRoundCorners(view: three_Label)
        setRoundCorners(view: nextButton)
        three_Label.clipsToBounds = false
        sendAmount_BaseView.roundSpecificCorner([.bottomLeft,.bottomRight], radius: 10)
        sendCurrency_BaseView.roundSpecificCorner([.topRight,.topLeft], radius: 10)
    }
}
