//
//  WebServices.swift
//  MIM
//
//  Created by APPLE on 05/07/21.
//

import Foundation
import Alamofire
import MBProgressHUD
//import FirebaseCrashlytics
class WebServices:NSObject {
    
    static let shared = WebServices()
    
    func callAPI<T:Codable>(_ url:URLConvertible, _ method:String,_ parameters:Parameters?, _ headers:[String:String], _ completion:@escaping(_ success:Bool, _ result:T?)-> Void) {
        print("URL: ",url)
        print("METHOD: ",method)
        print("PARAMETERS: ",parameters ?? Constants.empty)
        print("HEADERS: ",headers)
        LocalStore.shared.isSessionExpired = false
        do {
            var request = try URLRequest(url: url.asURL())
            request.cachePolicy = .reloadIgnoringCacheData
            request.httpMethod = method
            if !parameters!.isEmpty {
                if method == ApiMethods.PUT.rawValue {
                    request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                } else {
                    request.httpBody = parameters?.queryString.data(using: .utf8)
                }
            }
            
            request.allHTTPHeaderFields = headers
            request.timeoutInterval = 120.0
            MBProgressHUD.showAdded(to: UIApplication.appWindow, animated: true)
            AF.request(request).responseJSON { (response) in
                MBProgressHUD.hide(for: UIApplication.appWindow, animated: true)
                print("Response in Api: ",response)

                print("error in response : ",response.error ?? Constants.empty)
                if let error = response.error {
                    print("Error: ",error.localizedDescription)
                   
                   
                    if let responseData = response.data {
                        let htmlString = String(data: responseData, encoding: .utf8)
                        print("Result ",htmlString!)
                        
                        switch URLError.Code(rawValue: error._code) {
                        case .notConnectedToInternet:
                            DataHandler.shared.showAlert(title: error.localizedDescription, message: "")
                            MBProgressHUD.hide(for: UIApplication.appWindow, animated: true)
                        default:
                            DataHandler.shared.showAlert(title: Constants.appName, message: ErrorMessages.SomethingWentWrong.rawValue)
                            MBProgressHUD.hide(for: UIApplication.appWindow, animated: true)
                        }
                        return
                    } else {
                        if error.localizedDescription.contains("The Internet connection appears to be offline.") {
                            DataHandler.shared.showAlert(title: error.localizedDescription, message: "")
                            MBProgressHUD.hide(for: UIApplication.appWindow, animated: true)
                        } else {
                            DataHandler.shared.showAlert(title: Constants.appName, message: ErrorMessages.SomethingWentWrong.rawValue)
                            MBProgressHUD.hide(for: UIApplication.appWindow, animated: true)
                        }
                       MBProgressHUD.hide(for: UIApplication.appWindow, animated: true)
                        return
                    }
                } else {
                    if let data = response.data {
                        do{
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]

                            let error = json?["error"] as? NSDictionary
                            let errorType = error?["error"] as? String
                            if errorType == "Session token expired"{
                                LocalStore.shared.isSessionExpired = true
                                let alert = UIAlertController(title: Constants.appName, message: "Session expired", preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                                    self.logoutUser()
                                    print("logout the user")
                                }))
                                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
//                                self.present(alert, animated: true, completion: nil)
                            return
                            }
                        }catch{ print("erroMsg") }
                        
                //        self.parseDataIntoModel(request.url?.absoluteString ?? "",data, completion)
                        self.parseDataIntoModel("\(url)", data,  completion)
                    }else {
                        print("Error *********************************** Error")
                    }
                }
            }
        }
        catch {
            print(error.localizedDescription)
        }
    }
    func logoutUser(){

    }
    func parseDataIntoModel<T:Codable>(_ url : String, _ data:Data, _ completion:@escaping(_ success:Bool, _ result:T?)-> Void) {
    
        do {
            
            let decodedModel = try JSONDecoder().decode(T.self, from: data)

            completion(true, decodedModel)
            
            
        }
        catch {

            
            DataHandler.shared.showAlert(title: Constants.appName, message: ErrorMessages.SomethingWentWrong.rawValue + " please try again later")
            print(error.localizedDescription)
            print(error)
        }

    }
    
    func Headers(_ userID:String) -> [String:String] {
        return [ApiHeaders.ContentType:ApiHeaders.ValueContentType,
                ApiHeaders.AuthUserID:userID]
    }
    
//    func completeHeaders() -> [String:String] {
//        return [ApiHeaders.ContentType:ApiHeaders.ValueContentType,
//                ApiHeaders.SessionToken:LocalStore.shared.SessionToken ?? Constants.empty,
//                ApiHeaders.AuthUserID:LocalStore.shared.userMatchMoveId ?? Constants.empty,
//                ApiHeaders.Authorization:"Bearer \(LocalStore.shared.accessToken ?? Constants.empty)"]
//    }
    
    
}


