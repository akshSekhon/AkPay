//
//  Rateing_VC.swift
//  TruliPay
//
//  Created by Mobile on 13/04/22.
//

import UIKit
import IQKeyboardManagerSwift
class Rateing_VC: UIViewController,UITextViewDelegate {

    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var commentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        IQKeyboardManager.shared.enableAutoToolbar = false
//          IQKeyboardManager.shared.enable = true
        commentsTextView.delegate = self
        commentsTextView.textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        setAction()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Feedback")
       
viewDidLayoutSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        commentsTextView.becomeFirstResponder()
        commentsTextView.resignFirstResponder()
    }

    func setAction(){
        
        sendBtn.actionBlock {
            self.popToDashboard()
    }
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        DispatchQueue.main.async {
        textView.reloadInputViews()
        }
    }
}
