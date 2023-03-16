//
//  CompleteProfile_mpinVC.swift
//  TruliPay
//
//  Created by Mobile on 08/04/22.
//

import UIKit

class CompleteProfile_mpinVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var one_Label: UILabel!
    @IBOutlet weak var two_Label: UILabel!
    @IBOutlet weak var three_Label: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(vc: self, middleTitle: "Complete Profile")
        self.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUi()
    }
    func setUi(){
      //one_Label.layer.cornerRadius = userDetail_Label.bounds.width / 2
     // one_Label.clipsToBounds = true
    setRoundCorners(view: nextButton)
     setRoundCorners(view: one_Label)
     setRoundCorners(view: two_Label)
       setRoundCorners(view: three_Label)
        
    }
    @objc func backBtnClicked(){
        self.navigationController?.popViewController(animated: true)
    }

    
    func addActions(){
        self.nextButton.actionBlock {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: Controllers.MPINkeys_VC) as! MPINkeys_VC
            vc.newUser = true
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
