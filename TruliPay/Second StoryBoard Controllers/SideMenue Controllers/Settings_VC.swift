//
//  Settings_VC.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit

class Settings_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Setting")

    }


}
