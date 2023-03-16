//
//  UIApplicationExtension.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 05/12/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    class var appWindow: UIWindow! {
        let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
        return sceneDelegate.window!
    }
    
    class var rootViewController: UIViewController! {
        return self.appWindow.rootViewController!
    }
    
    class var visibleViewController: UIViewController! {
        return self.rootViewController.findContentViewControllerRecursively()
    }
    
    class var visibleNavigationController: UINavigationController! {
        return self.visibleViewController.navigationController!
    }
    
    class var visibleTabBarController: UITabBarController! {
        return self.visibleViewController.tabBarController!
    }
    
    class var visibleSplitViewController: UISplitViewController! {
        return self.visibleViewController.splitViewController!
    }
    
    class func pushOrPresent(_ viewController: UIViewController, animated: Bool) {
        if self.visibleNavigationController != nil {
            self.visibleNavigationController.pushViewController(viewController, animated: animated)
        } else {
            self.visibleViewController.present(viewController, animated: animated, completion: nil)
        }
    }
    
    class var appWindowFrame: CGRect {
        return self.appWindow.frame
    }
    
    class var navigationBarFrame: CGRect {
        return self.visibleNavigationController.navigationBar.frame
    }
    
    class var navigationBarHeight: CGFloat {
        return self.navigationBarFrame.size.height
    }
    
    class var statusBarHeight: CGFloat {
        return self.shared.statusBarFrame.size.height
    }
    
    class var tabBarFrame: CGRect {
        return self.visibleTabBarController.tabBar.frame
    }
    
    class var tabBarHeight: CGFloat {
        return self.tabBarFrame.size.height
    }
    
    class var interfaceOrientation: UIInterfaceOrientation {
        return self.shared.statusBarOrientation
    }
    
    class var interfaceOrientationIsLandscape: Bool {
        return self.interfaceOrientation == .landscapeLeft || self.interfaceOrientation == .landscapeRight
    }
    
    class var interfaceOrientationIsPortrait: Bool {
        return self.interfaceOrientation == .portrait
    }
    
    class var interfaceOrientationIsPortraitOrUpsideDown: Bool {
        return self.interfaceOrientation == .portrait || self.interfaceOrientation == .portraitUpsideDown
    }
}
extension UIApplication {
    var currentWindow: UIWindow? {
        connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
    }
}
