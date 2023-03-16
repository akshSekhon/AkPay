//
//  TransactionHistory_VC.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit

class TransactionHistory_VC: AbstractController {
    
    override var tblCell: AbstractTblCell.Type {
        return TransictionTableCell.self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      arrayTblItems = Array_transectionModel
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Transaction History")

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVw.dequeueReusableCell(withIdentifier: "TransictionTableCell", for: indexPath) as! TransictionTableCell
        if indexPath.row % 2 == 0{
            cell.iconImage.image = UIImage(named: Images.moneyPaidTo)

        cell.amountLbl.textColor = .red
            cell.amountLbl.text = "-$15.00"
        }
        else{
            cell.iconImage.image = UIImage(named: Images.moneyReceveFrom)
            cell.amountLbl.textColor = .green
            cell.amountLbl.text = "+$15.00"
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushOnly(Controllers.MoneyRecivedDone_VC)
    }
    
    //MARK: - button actions
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        
    }


  

}
