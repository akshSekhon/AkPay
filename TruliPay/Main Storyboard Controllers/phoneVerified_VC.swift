//
//  phoneVerified_VC.swift
//  TruliPay
//
//  Created by Mobile on 19/04/22.
//

import UIKit

class phoneVerified_VC: UIViewController {

    @IBOutlet weak var requestOtpBtn: UIButton!
    
    @IBOutlet weak var mobileNumber_TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setActions()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "")
        mobileNumber_TextField.setLeftPaddingPoints(5)
        mobileNumber_TextField.placeholderColor(color: UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1))
    }
    func setActions(){
        requestOtpBtn.actionBlock {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Controllers.MVC_VCController) as! MVC_VC
            vc.newUser = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
