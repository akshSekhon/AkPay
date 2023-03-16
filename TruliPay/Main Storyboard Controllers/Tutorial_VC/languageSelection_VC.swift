//
//  languageSelection_VC.swift
//  TruliPay
//
//  Created by Mobile on 09/04/22.
//

import UIKit

class LanguageSelection_VC: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setActions()
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.isHidden = true

        setRoundCorners(view: continueButton)
        
    }
    func setActions(){
        
        self.continueButton.actionBlock {
            self.pushOnly(Controllers.TutorialCollection_VC)
        }
    }
  
}
