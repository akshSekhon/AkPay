//
//  SideMenue_VC.swift
//  TruliPay
//
//  Created by Mobile on 15/04/22.
//

import UIKit
import SideMenuSwift
class SideMenue_VC: AbstractController{
   
    
    
    override var tblCell: AbstractTblCell.Type {
        return sideMenueTableCell.self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayTblItems = ARRAY_SideMenueModel
        sideMenueMethods()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tblVw.frame.height/CGFloat(ARRAY_SideMenueModel.count + 1 )
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowIndex = indexPath.row
        
        switch indexPath.row {
          
        case 0,1,2,3,4,5,6:
            sideMenuController?.setContentViewController(with: "\(rowIndex)")
            sideMenuController?.hideMenu()
            
        case 7,8:
            print("Empty")
        case 9:
            LocalStore.shared.ShowKYCPopUp = true
            setInitialNavigationController(StoryboardId.main, to: NaviControllers.Login_NC)
            print("Logout")
        default:
            break
        }
    }
    func sideMenueMethods(){
       // SideMenuController.preferences.basic.menuWidth = 268
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: NaviControllers.dashboard_NC)
        }, with: "0")

        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: NaviControllers.masterCard_NC)
        }, with: "1")
        
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: NaviControllers.transaction_NC)
        }, with: "2")
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: NaviControllers.referAndEarn_NC)
        }, with: "3")
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: NaviControllers.settings_NC)
        }, with: "4")
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: NaviControllers.FAQ_NC)
        }, with: "5")
        sideMenuController?.cache(viewControllerGenerator: {
            self.storyboard?.instantiateViewController(withIdentifier: NaviControllers.rateing_NC)
        }, with: "6")

        sideMenuController?.delegate = self
    }
    
}
extension SideMenue_VC:SideMenuControllerDelegate {
    func sideMenuController(_ sideMenuController: SideMenuController, animationControllerFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return BasicTransitionAnimator(options: .transitionFlipFromLeft, duration: 0.6)
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, willShow viewController: UIViewController, animated: Bool) {
        SideMenueSingleTon.shared.sidemenueisOpen = true

        print("***********")
    }
    
    func sideMenuController(_ sideMenuController: SideMenuController, didShow viewController: UIViewController, animated: Bool) {
        print("***********")
    }
         
    func sideMenuControllerWillRevealMenu(_ sideMenuController: SideMenuController) {
        print("***********")
    }
    
    func sideMenuControllerDidRevealMenu(_ sideMenuController: SideMenuController) {
        print("***********")
    }
    
    func sideMenuControllerWillHideMenu(_ sideMenuController: SideMenuController) {
        print("***********")
    }
    
    func sideMenuControllerDidHideMenu(_ sideMenuController: SideMenuController) {
        print("***********")
    }
//    func executeLogin() {
//           let loginVC = UIStoryboard(name: "SecondStoryboard", bundle: nil).instantiateViewController(withIdentifier: "dashboard_NC")
////           self.window?.rootViewController = loginVC
////           self.window?.makeKeyAndVisible()
//        UIApplication.shared.windows.first?.rootViewController = loginVC
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//       }
    
   
}
