//
//  LocalStore.swift
//  TruliPay
//
//  Created by APPLE on 08/04/22.
//

import Foundation
class LocalStore : NSObject{
    static let shared = LocalStore()
    
    var firstTime:Bool! {
        get {
         //   UserDefaults.standard.bool(forKey: "isTutorialScreen")
            return UserDefaults.standard.value(forKey: "isTutorialScreen") as? Bool
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isTutorialScreen")
        }
    }
    
    var isSessionExpired:Bool!  {
        get {
           // UserDefaults.standard.bool(forKey: "isSessionExpired")
            return UserDefaults.standard.value(forKey: "isSessionExpired") as? Bool
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isSessionExpired")
        }
    }
    
    var ShowKYCPopUp: Bool {
         get {
             return UserDefaults.standard.value(forKey: "ShowKYCPopUp") as? Bool ?? true
         } set {
             UserDefaults.standard.setValue(newValue, forKey: "ShowKYCPopUp")
         }
     }
}
