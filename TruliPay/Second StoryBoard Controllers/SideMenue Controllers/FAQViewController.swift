//
//  FAQViewController.swift
//  MIM
//
//  Created by APPLE on 07/07/21.
//

import UIKit

class FAQViewController: AbstractController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtField_Search: UITextField!
    @IBOutlet weak var btn_Back: UIButton!
    @IBOutlet weak var btn_Menu: UIButton!
    @IBOutlet weak var view_Registration: UIView!
    @IBOutlet weak var view_TopUp: UIView!
    @IBOutlet weak var view_KYC: UIView!
    @IBOutlet weak var view_SendMoney: UIView!
    @IBOutlet weak var view_ReferAndEarn: UIView!
    @IBOutlet weak var view_MiM: UIView!
    
    
    //MARK:- View Did Load
    var isCellTapped = false
    var currentRow = -1
    var selectedRowIndex : Int?
    var fAQViewModel : FAQ_Model!
    var faq = Array_FAQ_Model
    
    //for searching
    var searchArrRes = [Any]()
    var searching:Bool = false
    
    
    override var tblCell: AbstractTblCell.Type {
        
        return FaqTableViewCell.self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //       tblVw.rowHeight = UITableView.automaticDimension
        //       tblVw.estimatedRowHeight = UITableView.automaticDimension
        
        self.tblVw.register(UINib(nibName: "FaqTableViewCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "FaqTableViewCell")
        viewAction()
        txtField_Search.delegate = self
//        fAQViewModel = FAQ_Model(self)
//        fAQViewModel.CallFaqApi()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "FAQ")

        selectedRowIndex = nil
    arrayTblItems = Array_FAQ_Model
    }
    
    //MARK:- View Actions
    func viewAction() {
//        btn_Back.actionBlock { [weak self] in
//            guard let self = self else { return }
//            self.popOnly()
//
//        }
    }
    override func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let searchText  = textField.text! + string
        if searchText.count > 1 {
//            let srchArray = searchArrRes as! [FAQ]
//            arrayTblItems = srchArray.filter{$0.question!.lowercased().contains(searchText.lowercased())}
        }else{
            arrayTblItems = searchArrRes
        }
        self.tblVw.reloadData()
        return true
    }
}


extension FAQViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "")
    //        return cell
    //    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath.row
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == selectedRowIndex {
            if selectedRowIndex == indexPath.row {
                
                
                //               return 150
                return UITableView.automaticDimension
            }
            
            return 60
            //            if isCellTapped == true {
            //                isCellTapped = false
            //                return 140
            //            } else if isCellTapped == false {
            //                isCellTapped = true
            //                return 60
            //            }
            
        }
        
        return 60
    }
    
}
//extension FAQViewController : FAQViewModelDelegate{
//    func faqError(_ error: String) {
//        UIAlertController
//            .showAlert(Constants.appName, message: error, buttons: [Constants.ok], completion: nil)
//    }
//    func faqSuccess(_ mdl: GetFAQModel?) {
//
//        //arrayTblItems.append(mdl?.data?.faqs)
//        if mdl != nil {
//            self.arrayTblItems = mdl!.data!.faqs!
//            self.searchArrRes = mdl!.data!.faqs!
//            print(arrayTblItems.count,searchArrRes.count)
//        }
//        //arrayTblItems = mdl?.data?.faqs! as! [Any]
//    }
//}
