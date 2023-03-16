//
//  MPINkeys_VC.swift
//  TruliPay
//
//  Created by Mobile on 08/04/22.
//

import UIKit
import SideMenuSwift
class MPINkeys_VC: UIViewController, UINavigationControllerDelegate {

  var textFieldTextArr = [String]()
    
var newUser = false
    
    @IBOutlet var secureImageFirst: UIImageView!
    @IBOutlet var secureImageSecond: UIImageView!
    @IBOutlet var secureImageThird: UIImageView!
    @IBOutlet var secureImageFourth: UIImageView!

    
    @IBOutlet weak var beletBtn: RoundedButtonWithShadow!
    
    @IBOutlet weak var ForgotPin_Button: UILabel!
    
    @IBOutlet weak var login_Button: UIButton!
    
    @IBOutlet weak var lbl_MPINTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBar(vc: self, middleTitle: "")
        if newUser == true{
            lbl_MPINTitle.text = "Enter MPIN"
        }else if newUser == false{
            lbl_MPINTitle.text = "Enter Secure PIN"
        }else {
            lbl_MPINTitle.text = "Enter MPIN"
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
        override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setRoundCorners(view: login_Button)

        
    }
    //MARK: - button actions
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        
    }
    @IBAction func keyboardBtb_Actions(_ sender: UIButton) {
        
        print("Button Click is",sender.tag)
        
        if sender.tag < 10{
            
            if textFieldTextArr.count < 4{
            textFieldTextArr.append("\(sender.tag)")
               UpdateMPIN()
            }
            else{
            print ("Over Attempt")
        
            }
       
      

        }
      
        else{
            guard textFieldTextArr.count > 0 else {return}
            textFieldTextArr.removeLast()
            UpdateMPIN()
        }
         
    }
    func UpdateMPIN(){
        if textFieldTextArr.count == 0 {
            secureImageFirst.backgroundColor = .systemBackground
            secureImageSecond.backgroundColor = .systemBackground
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 1{
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = .systemBackground
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 2{
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 3{
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageThird.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageFourth.backgroundColor = .systemBackground
        }else if textFieldTextArr.count == 4 {
            secureImageFirst.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageSecond.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageThird.backgroundColor = UIColor(named: AppColor.mainBleColor)
            secureImageFourth.backgroundColor = UIColor(named: AppColor.mainBleColor)
        }else {
            secureImageFirst.backgroundColor = .systemBackground
            secureImageSecond.backgroundColor = .systemBackground
            secureImageThird.backgroundColor = .systemBackground
            secureImageFourth.backgroundColor = .systemBackground
        }
    }
    func setActions(){
        self.login_Button.actionBlock {
            
            if self.newUser{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: Controllers.Login_VC) as! Login_VC
                vc.newUserLogin = false
                self.navigationController?.pushViewController(vc, animated: true)
                
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                let homeVC = storyboard.instantiateViewController(withIdentifier: Controllers.Login_VC) as! Login_VC
//
//                //Below's navigationController is useful if u want NavigationController in the destination View
//                let navigationController = UINavigationController(rootViewController: homeVC)
////                appDelegate.rootViewController = navigationController
////                appDelegate.window?.rootViewController
//                UIApplication.shared.currentWindow?.rootViewController = navigationController
                
                
//                self.navigationController?.popToRootViewController(animated: true)
//                self.setInitialNavigationController(StoryboardId.main, to: NaviControllers.Login_NC)
                
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//
//                let controller =  storyboard.instantiateViewController(withIdentifier:Controllers.Login_VC) as! Login_VC
//
//
//
//                let navigationController = UINavigationController(rootViewController: controller)

//                self.(navigationController, animated: true, completion: nil)
//                self.navigationController?.pushViewController(navigationController, animated: true)
            }
            else{
            
//            self.pushOnly(Controllers.DashboardViewController)
            let contentViewController = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateViewController(withIdentifier: "dashboard_NC")
                   let menuViewController = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateViewController(withIdentifier: "sideMenue_NC")
                   let sideMenuController = SideMenuController(contentViewController: contentViewController, menuViewController: menuViewController)
                   UIApplication.shared.keyWindow?.rootViewController = sideMenuController
            
//            self.pushOnly(Controllers.SendMoneyMethodsViewController)
//            let storyboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
//              let controller = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
// //             self.present(controller, animated: true)
//            self.navigationController?.pushViewController(controller, animated: true)
            }
    }
        
        ForgotPin_Button.actionBlock {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Controllers.MVC_VCController)as!MVC_VC
            vc.forgetMpin = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
