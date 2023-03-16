//
//  SendMoneyMethodsViewController.swift
//  TruliPay
//
//  Created by APPLE on 12/04/22.
//

import UIKit


class SendMoneyMethodsViewController: AbstractController {

    
    //MARK:- Override Variables
    override var tblCell: AbstractTblCell.Type {
        return SendMoneyMethodTableViewCell.self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        
        setNavigationBar(vc: self, middleTitle: "Send money")
        
        //        navigationItem.titleView = UIImageView.init(image: UIImage(named: TOP_BAR_IMAGE))
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: TOP_BAR_IMAGE), for: .default)
//        title = "Send money"
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//
//        let leftBtn = UIBarButtonItem(image:UIImage(named: "left_arrow"), style: .plain, target: self, action: #selector(backBtnClicked))
//        self.navigationItem.leftBarButtonItem = leftBtn
//        navigationController?.navigationBar.tintColor = UIColor.black
        
// passing data to tableView
        arrayTblItems = ARRAY_PaymentMethods
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.pushOnly(Controllers.OtherWaletMobileNumber_VC)
        case 1:
            self.pushOnly(Controllers.DomesticBankSendingMoney_VC)
        case 2:
            self.pushOnly(Controllers.SendMoneyToDetails_VC)
        case 3:
            self.pushOnly(Controllers.SendMoneyQRScanner_VC)
        default:
            break
        }
    }
    //MARK: - button actions
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        
    }

}
