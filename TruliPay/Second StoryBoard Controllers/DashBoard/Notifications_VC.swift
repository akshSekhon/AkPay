//
//  Notifications_VC.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit

class Notifications_VC: AbstractController {

    
//    override var navTitle: String{
//        return "side menu "
//    }
//    override var isHomenavTitle: String{
//        return "wgtewhyert"
//    }
    
    override var tblCell: AbstractTblCell.Type {
        return NotificationTableCell.self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
//isHomenavTitle = ""
        
      arrayTblItems = Array_Notifications
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Notification")

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    //MARK: - button actions
    
   @objc func backBtnClicked(){
       self.navigationController?.popViewController(animated: true)
    }
}
