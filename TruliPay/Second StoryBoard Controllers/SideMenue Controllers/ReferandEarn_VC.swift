//
//  ReferandEarn_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit

class ReferandEarn_VC: UIViewController {

    @IBOutlet weak var shareCodeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Refer & Earn")

    }
    
    func setActions(){
        
        shareCodeButton.actionBlock {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
