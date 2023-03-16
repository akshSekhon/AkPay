//
//  Constants.swift
//  MIM
//
//  Created by APPLE on 05/07/21.
//

import Foundation
import UIKit


struct AppColor {
    
    static let grayBorderColor = "fieldBorderColor"
    static let mainBleColor = "Main_BlueColor"
 static let fieldsBackGroundColor = "textFieldBgColor"
    
    
//    static let whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
//    static let mainThemeColor = UIColor(red: 12/255, green: 12/255, blue: 12/255, alpha: 1.0)
//    static let redColor = UIColor(red: 228/255, green: 17/255, blue: 18/255, alpha: 1.0)
//    static let gradient1 = UIColor(red: 236/255, green: 28/255, blue: 36/255, alpha: 1.0)
//    static let gradient2 = UIColor(red: 114/255, green: 3/255, blue: 3/255, alpha: 1.0)
//    static let unselectedItem = UIColor(red: 222/255, green: 112/255, blue: 113/255, alpha: 1.0)
//    static let selectedRedColor = UIColor(red: 203/255, green: 0/255, blue: 0/255, alpha: 1.0)
//    static let unselectedGrayColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0)
}

struct AppFonts{
    
    static let regular = "Lato-Regular"
    static let Light = "Lato-Light"
    static let Bold = "Lato-Bold"
 
}

struct AppStrings{
    static let tutorialOneDiscriptionText = "A growing number of people  are turning to the internet to do their shopping. Making it as easy as possible for coustmers to pay is essential for increasing conversions and  sales. This is why your checkout page is so important."
    
    static let tutorialTwoDiscriptionText = " Mastercard is the second-largest payments network,ranked behind Visa, in the global payments industry.Other major payments networks include American Express and Discover."
    
    static let tutorialThreeDiscriptionText = "A remittance is a payment of money that is transferred to another party. Broadly speaking, any payment of an invoice or a bill can be called a remittance."
    
    static let tutorialOneTitleLabelText = "Make Payment Easier"
    static let tutorialTwoTitleLabelText = "Order Master Card"
    static let tutorialThreeTitleLabelText = "Make Remittance Easier"

   static var tutorialtitlesTxtArr = [tutorialOneTitleLabelText,tutorialTwoTitleLabelText,tutorialThreeTitleLabelText]
    
    static var tutorialDiscriptTxtArr = [tutorialOneDiscriptionText,tutorialTwoDiscriptionText,tutorialThreeDiscriptionText]

    
}


struct Constants {
    static let empty = ""
    static let fetchingData = "Fetching data"
    static let zero = "0"
    static let One = "1"
    static let Two = "2"
    static let emptySpace = " "
    static let appName = "TruliPay"
    static let ok = "Ok"
    static let Plus = "+"
//    static let DefaultDevieToken = "1234567890"
}

struct Images {
    static let tutorialImgArr = ["tut_1","tut_2","tut_3"]
    static let topNavIgationImage = ""
    static let LeftArrow = "left_arrow"
    static let RightArrow = "arrow_right"
    static let threeDot = "dot"
    static let Dropdown = "drop_arrow_"
    static let addContact = "add_contact"
    static let dobCalander = "dob"
    static let RoundDarcheck = ""
    static let radioUnCheck = "radio_off_button"
    static let radioCheckImg = "radio_on_button"
    static let moneyReceveFrom = "reciveFrom"
    static let moneyPaidTo = "pay_2"
    static let cameraImg = "camera_button"
}

struct NaviControllers{
    static let Login_NC = "Login_NC"
    static let dashboard_NC = "dashboard_NC"
    static let referAndEarn_NC = "referAndEarn_NC"
    static let rateing_NC = "rateing_NC"
    static let settings_NC = "settings_NC"
    static let transaction_NC = "transaction_NC"
    static let FAQ_NC = "FAQ_NC"
    static let masterCard_NC = "masterCard_NC"
    
}
struct StoryboardId {
   static let main = "Main"
    static let SecondStoryboard = "SecondStoryboard"
    
}

struct Controllers {
    static let DashboardViewController = "DashboardViewController"
    static let MVC_VCController = "MVC_VC"
    static let TutorialCollection_VC = "TutorialCollection_VC"
    static let CompleteProfile_VC = "CompleteProfile_VC"
    static let CompleteProfile_addressVC = "CompleteProfile_addressVC"
    static let CompleteProfile_mpinVC = "CompleteProfile_mpinVC"
    static let Login_VC = "Login_VC"
    static let MPINkeys_VC = "MPINkeys_VC"
    static let Home_VC = "Home_VC"
    static let SendMoneyMethodsViewController = "SendMoneyMethodsViewController"
    static let ConfirmAddress_VC = "ConfirmAddress_VC"
    static let MyVallet_VC = "MyVallet_VC"
    static let RecivedMoneyMyVallet_Vc = "RecivedMoneyMyVallet_Vc"
    static let SendMoneyToDetails_VC = "SendMoneyToDetails_VC"
    static let SendingMoneyReciversDetail_VC = "SendingMoneyReciversDetail_VC"
    static let SendMoneyAmmount_VC = "SendMoneyAmmount_VC"
    static let SendAmountMpin_VC = "SendAmountMpin_VC"
    static let UpdateKYC_VC = "UpdateKYC_VC"
    static let DomesticBankSendingMoney_VC = "DomesticBankSendingMoney_VC"
    static let AddSelfie_VC = "AddSelfie_VC"
    static let MasterCard_VC = "MasterCard_VC"
    static let OtherWaletMobileNumber_VC = "OtherWaletMobileNumber_VC"
    static let OtherWalletSendMoneyTo_EnterAmount_VC = "OtherWalletSendMoneyTo_EnterAmount_VC"
    static let OtherWalletSellectedContact_VC = "OtherWalletSellectedContact_VC"
    static let SendMoneyQRScanner_VC = "SendMoneyQRScanner_VC"
    static let ReferandEarn_VC = "ReferandEarn_VC"
    static let Rateing_VC = "Rateing_VC"
    static let Settings_VC = "Settings_VC"
    static let ForgotMPIN_VC = "ForgotMPIN_VC"
    static let Notifications_VC = "Notifications_VC"
static let TransactionHistory_VC = "TransactionHistory_VC"
    static let SideMenue_VC = "SideMenue_VC"
    static let FAQViewController = "FAQViewController"
    static let MoneyRecivedDone_VC = "MoneyRecivedDone_VC"
    static let DomesticMPIN_VC = "DomesticMPIN_VC"
    static let phoneVerified_VC = "phoneVerified_VC"
    
}




struct TableViewCells {
   static let paymentMethods = ""
    static let NotificationTableCell = "NotificationTableCell"
    static let sideMenueTableCell = "sideMenueTableCell"
}

struct CollectionViewCell{
    static let MyappsCollectonCell = "MyappsCollectonCell"
     static let SpecialsCollectionViewCell = "SpecialsCollectionViewCell"

}

struct Apis {
 
}


struct Params {

}

// MARK: - Data Models Of Side Menue tableViews
struct SideMenueModel {
//    let id:Int
    let iconImage : String
    let title : String
}

let ARRAY_SideMenueModel = [SideMenueModel(iconImage: "home_", title: "Home"),
                            SideMenueModel(iconImage: "master_card", title: "Master Card"),
                            SideMenueModel(iconImage: "transaction", title: "Transaction History"),
                            SideMenueModel(iconImage: "refer_icon", title: "Refer & Earn"),
                            SideMenueModel(iconImage: "settings", title: "Settings"),
                            SideMenueModel(iconImage: "peace", title: "Need Help"),
                            SideMenueModel(iconImage: "feedback", title: "Share Feedback"),
                            SideMenueModel(iconImage: "", title: ""),
                            SideMenueModel(iconImage: "", title: ""),
                            SideMenueModel(iconImage: "logout", title: "Log Out")
                      ]


let ARRAY_Gender = ["MALE","FEMALE"]
let ARRAY_CountryName = ["India","America","Bangalesh","Australia"]
let ARRAY_StateName = ["Punjab","Mumbai","Himachal Pardesh","Delhi"]
let ARRAY_Network = [""]
let ARRAY_PaymentMode = ["DRAFT","NFT"]
let ARRAY_SelectID = ["Demo 1","Demo 2","Demo 3"]


// MARK: - Data Models Of tableViews
struct PaymentMethodsModel {
//    let id:Int
    let iconImage : String
    let title : String
}

let ARRAY_PaymentMethods = [PaymentMethodsModel(iconImage: "wallet_2", title: "To other wallet"),
                            PaymentMethodsModel(iconImage: "bank", title: "To domestic bank"),
                            PaymentMethodsModel(iconImage: "worldwide", title: "Remittance"),
                     PaymentMethodsModel(iconImage: "qr-code_2", title: "Scan QR code or Unique id")
                      ]

struct NotificationModel {
    let iconimage : String
    let userName : String
    let dateText : String
    let ammount : String
}
let Array_Notifications = [NotificationModel(iconimage: "img", userName: "John", dateText: "10apr,10:00PM", ammount: "$55.00"),
                           NotificationModel(iconimage: "img", userName: "Stephen", dateText: "20aug,10:30PM", ammount: "$5.00"),
                           NotificationModel(iconimage: "img", userName: "Mark", dateText: "15apr,10:25PM", ammount: "$33.00"),
                           NotificationModel(iconimage: "img", userName: "user", dateText: "18apr,10:45PM", ammount: "$58.30"),
                           NotificationModel(iconimage: "img", userName: "Jack", dateText: "5apr,05:55PM", ammount: "$10.60")
]

struct TransectionModel {
    let iconimage : String
    let userName : String
    let dateText : String
    let ammount : String
}
let Array_transectionModel = [TransectionModel(iconimage: "wallet_2", userName: "John", dateText: "10apr,10:00PM", ammount: "$55.00"),
                              TransectionModel(iconimage: "bank", userName: "Stephen", dateText: "20aug,10:30PM", ammount: "$5.00"),
                              TransectionModel(iconimage: "worldwide", userName: "Mark", dateText: "15apr,10:25PM", ammount: "$33.00"),
                              TransectionModel(iconimage: "bank", userName: "user", dateText: "18apr,10:45PM", ammount: "$58.30"),
                              TransectionModel(iconimage: "wallet_2", userName: "Jack", dateText: "5apr,05:55PM", ammount: "$10.60")
]


struct ReciveMoneyInModel {
    let iconimage : String
    let paymentType : String
}
let Array_reciveMoneyInModel = [ReciveMoneyInModel(iconimage: "radio_on_button", paymentType: "My Wallet"),
                              ReciveMoneyInModel(iconimage: "radio_off_button", paymentType: "Ac 4785-5896-1234"),
                              ReciveMoneyInModel(iconimage: "radio_off_button", paymentType: "Ac 1235-4567-7589")
]

struct FAQ_Model {
   
    let titleText : String
    let answers : String
}
// MARK: - FAQ
struct FAQ: Codable {
    let id, question, answer: String?
}
let Array_FAQ_Model = [FAQ_Model(titleText: "How do i add money to my wallet?",answers: "nvbsdbfsdbfsdk,fbks,dfbskd,fbsdkjfsdfkfkbsdkf"),
                       FAQ_Model(titleText: "How do i link my bank account to the app for payment?",answers: "sdfsdfsdfsdfsdf"),
                       FAQ_Model(titleText: "What is domestic payment?",answers: "sdfsdfsdfbsdfksbfksbdfksjdbfskbdf"),
                       FAQ_Model(titleText: "How can i earn monev?",answers: "sdfsdfsdfsfsdf"),
                       FAQ_Model(titleText: "What should i do if i make a payment and the receiver did't receive?",answers: "sdsdsdfsdfsfsdfsdfsdfsdf")
                       
]


// MARK: - Data Models Of CollectionViews
struct MyAppDataModel {
//    let id:Int
    let iconImage : String
    let title : String
}

let ARRAY_MyAppDataModel = [MyAppDataModel(iconImage: "master_card", title: "Master Card"),
                            MyAppDataModel(iconImage: "my_wallet_", title: "My Wallet"),
                            MyAppDataModel(iconImage: "send_money_", title: "Send Money"),
                            MyAppDataModel(iconImage: "transaction_history_", title: "Transaction History")
                      ]

struct ServicesDataModel {
    let iconImage : String
    let title : String
}

let ARRAY_ServicesDataModel = [ServicesDataModel(iconImage: "electricity_", title: "Electricity Bill"),
                               ServicesDataModel(iconImage: "moible_rechange", title: "Mobile Recharge")
                      ]




struct SpecialsDataModel{
    let iconImage : String
    let title : String
}
let ARRAY_SpecialsDataModel = [SpecialsDataModel(iconImage: "banner", title: "Electricity Bill"),
                               SpecialsDataModel(iconImage: "banner", title: "Mobile Recharge"),
                               SpecialsDataModel(iconImage: "banner", title: "Mobile Recharge")
                      ]


struct PromotionsDataModel {
    let iconImage : String
    let title : String
}

let ARRAY_PromotionsDataModel = [PromotionsDataModel(iconImage: "referral", title: "Referrals")]



struct ApiHeaders {
    static let ContentType = "Content-Type"
    static let SessionToken = "Sessiontoken"
    static let AuthUserID = "X-Auth-User-ID"
    static let Authorization = "Authorization"
    static let ValueContentType = "application/x-www-form-urlencoded"
    
}

struct QueueName {
  

}

struct DateFormats {
    static let YearMonthDate = "YYYY-MM-dd"
}

enum ToastMessages:String {
    case LoginSuccessful = "You are successfully logged in"
    case RegisterationSuccessful = "Congratulations, Your account has been successfully created. \nPlease login to continue"
  
   
}

enum ApiMethods:String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum ErrorMessages:String {
    case UnknownType = "UNKNOWN TYPE"
    
    case SomethingWentWrong = "Something went wrong"
   
}


