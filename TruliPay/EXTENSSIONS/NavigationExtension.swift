//
//  NavigationExtension.swift
//  TruliPay
//
//  Created by Mobile on 16/04/22.
//

import UIKit
import SideMenuSwift
extension UIViewController{
    
    //--SET NAVIGATION BAR
    func setNavigationBar(vc: UIViewController ,middleTitle: String,fontSize: CGFloat = 16,backBtnImg: UIImage = UIImage(systemName: "chevron.left")!,rightimg: UIImage = UIImage(),backBtbTitle: String = "",rightBtnTitle: String = "",leftAction: Selector? = #selector(backButtonAction(sender:)), rightAction: Selector? = #selector(rightBtnAction(sender:))) {
        
        navigationController?.isNavigationBarHidden = false
//        navigationController?.navigationBar.isHidden = false

        navigationController?.navigationBar.isTranslucent = true
        setNavigationColor(naviBgColor: .clear,naviTinyColor: .label)

        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.red,
            .font: UIFont(name: AppFonts.regular, size: 16)!
        ]
        navigationItem.title = middleTitle
        
        
        let iphoneFont = [NSAttributedString.Key.font: UIFont(name: AppFonts.regular, size: 16)]
//                                UIFont.systemFont(ofSize: 25)]
        let ipadFont = [NSAttributedString.Key.font: UIFont(name: AppFonts.regular, size: 20)]
        
        //assign button to navigationbar
        
        //-- RIGHT BUTTON
        let rightBtn: UIButton = UIButton()
        rightBtn.setTitle(rightBtnTitle, for: .normal)
        rightBtn.titleLabel?.text = ""
//        rightBtn.titleColor(for: .normal) = UIColor(named: "Main_Color")
        rightBtn.setTitleColor(UIColor(named: AppColor.mainBleColor), for: .normal)
//        rightBtn.titleLabel?.text = rightBtnTitle
        rightBtn.titleLabel?.font =  UIFont(name: AppFonts.regular, size: fontSize)
        
//        rightBtn.font = UIFont(name: "Lato-Regular", size: 14) ?? .systemFont(ofSize: 14)
//        rightBtn.imageView?.contentMode = .scaleAspectFit
//            rightBtn.contentVerticalAlignment = .fill
//            rightBtn.contentHorizontalAlignment = .fill
        rightBtn.setImage(rightimg, for: .normal)
        
        let barButton = UIBarButtonItem(customView: rightBtn)
        //-- Back BUTTON
        let leftBtn = UIButton()
        
        leftBtn.imageView?.contentMode = .scaleAspectFit
            leftBtn.contentVerticalAlignment = .fill
            leftBtn.contentHorizontalAlignment = .fill
        leftBtn.setImage( backBtnImg, for: .normal)
        
        let leftBarButton = UIBarButtonItem(customView: leftBtn)
        
        //--BUTTON ACTIONS
        leftBtn.addTarget(vc, action: leftAction!, for: .touchUpInside)
        rightBtn.addTarget(vc, action: rightAction!, for: .touchUpInside)
        // MENAGES FOR PHONE AND IPAD
        
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            self.navigationController?.navigationBar.titleTextAttributes = ipadFont as [NSAttributedString.Key : Any]
            leftBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 10)
            rightBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        }else{
            self.navigationController?.navigationBar.titleTextAttributes = iphoneFont as [NSAttributedString.Key : Any]
            leftBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 10)
            rightBtn.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        }
        self.navigationItem.leftBarButtonItem = leftBarButton
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    @objc func backButtonAction(sender: UIButton){
        if SideMenueSingleTon.shared.sidemenueisOpen {
            popToDashboard()
           
            SideMenueSingleTon.shared.sidemenueisOpen = false
        }
        else{
            navigationController?.popViewController(animated: true)

        }
        
    }
    @objc func rightBtnAction(sender: UIButton){
print("RightBtn Clicked")    }
    
    func setNavigationColor(naviBgColor: UIColor,naviTinyColor: UIColor = .white){
        let navBarAppearance = UINavigationBarAppearance()
         navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = naviBgColor
        navigationController?.navigationBar.shadowImage = nil
        navBarAppearance.shadowColor = .clear
    self.navigationController?.navigationBar.standardAppearance = navBarAppearance
    self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    navigationController?.navigationBar.tintColor = naviTinyColor
    }
    
    func popToDashboard(){
        self.sideMenuController?.setContentViewController(with: "0",animated: false,completion: {
            let transition = CATransition()
            transition.duration = 0.4
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
//                self.view.window?.layer.add(transition, forKey: kCATransition)
            UIApplication.shared.currentWindow?.layer.add(transition, forKey: kCATransition)
        })
        
    }
    func setInitialNavigationController(_ StoryBoadrId: String, to identifier: String){
    let naviController = UIStoryboard(name: StoryBoadrId, bundle: nil).instantiateViewController(withIdentifier: identifier)
        UIApplication.shared.currentWindow?.rootViewController = naviController
        UIApplication.shared.currentWindow?.makeKeyAndVisible()
   }
}

extension UINavigationController {
    func getViewController<T: UIViewController>(of type: T.Type) -> UIViewController? {
        return self.viewControllers.first(where: { $0 is T })
    }

    func popToViewController<T: UIViewController>(of type: T.Type, animated: Bool) {
        guard let viewController = self.getViewController(of: type) else { return }
        self.popToViewController(viewController, animated: animated)
    }
}
//---
//  self.navigationController?.popToViewController(of: YourViewController.self, animated: true)

class SideMenueSingleTon{
     static let shared = SideMenueSingleTon()
    
    var sidemenueisOpen = false
    
}

