//
//  RecivedMoneyMyVallet_Vc.swift
//  TruliPay
//
//  Created by Mobile on 12/04/22.
//

import UIKit

class RecivedMoneyMyVallet_Vc: AbstractController {
    var btnView:ButtonView!
//    var selectedIndex:t = -1
    override var tblCell: AbstractTblCell.Type {
        return ReciveMonewTableCell.self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     arrayTblItems = Array_reciveMoneyInModel
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "My Wallet")
        self.tblVw.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition:.none)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0,y: 0,width: self.tblVw.frame.width,height: 100))
        footerView.backgroundColor = .red
//        let Vw = SkipKYCView()
        btnView = ButtonView()
        btnView.frame = footerView.frame
        footerView.addSubview(btnView)
        btnView.btn_Save.actionBlock {
            print("Button Clicked")
        }
        return footerView
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tblVw.dequeueReusableCell(withIdentifier: "ReciveMonewTableCell", for: indexPath) as! ReciveMonewTableCell
//        if indexPath.row == selectedIndex {
//            cell.checkImageView.image = UIImage(named: Images.radioCheckImg)
//        }
//        else{
//            cell.checkImageView.image = UIImage(named: Images.radioUnCheck)
//
//        }
//
//        return cell
//    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        selectedIndex = indexPath.row
////        tblVw.reloadData()
//        let cell = tblVw.dequeueReusableCell(withIdentifier: "ReciveMonewTableCell") as! ReciveMonewTableCell
//
//        if cell.isSelected{
//            cell.checkImageView.image = UIImage(named: Images.radioCheckImg)
//        }
//        else{
//            cell.checkImageView.image = UIImage(named: Images.radioUnCheck)
//        }
//    }
   

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let cell = tableView.cellForRow(at: indexPath) as! ReciveMonewTableCell
         //  cell.backgroundColor = .red
        cell.checkImageView.image = UIImage(named: Images.radioCheckImg)
       }
       func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
           let cell = tableView.cellForRow(at: indexPath) as! ReciveMonewTableCell
         //  cell.backgroundColor = .systemBackground
           cell.checkImageView.image = UIImage(named: Images.radioUnCheck)
       }
    //MARK: - button actions
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        
    }
}
