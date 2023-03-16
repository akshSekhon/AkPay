//
//  DashboardViewController.swift
//  TruliPay
//
//  Created by APPLE on 08/04/22.
//

import UIKit
import SideMenuSwift
class DashboardViewController: UIViewController {

    
    
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var completeKycView: UIView!
    @IBOutlet weak var phoneVerifiedView: UIView!
    
    
    
    @IBOutlet weak var seeAllLabel: UILabel!
    @IBOutlet weak var notificationImg: UIImageView!
    @IBOutlet weak var myAppsCollectView: UICollectionView!
    @IBOutlet weak var servicesCollectView: UICollectionView!
    @IBOutlet weak var specialsCollectView: UICollectionView!
    @IBOutlet weak var promotionsCollectView: UICollectionView!
    @IBOutlet weak var myAppsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var myappsCollec_BaseView: UIView!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    var completeKyc:CompleteKYCView!
    var skipKycView:SkipKYCView!

    var CollectionItemDivideTo : CGFloat = 1
    var seeAll = false
    var timer: Timer?
    var currentcellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionsDelegatesCalling()
        SideMenuController.preferences.basic.position = .sideBySide
        SideMenuController.preferences.animation.shadowAlpha = 0.5
        SideMenuController.preferences.basic.enablePanGesture = false
        print(LocalStore.shared.ShowKYCPopUp)
        
        if LocalStore.shared.ShowKYCPopUp == true {
            addKycPopUp()
            LocalStore.shared.ShowKYCPopUp = false
        }else{
            
        }
        //addKycPopUp()
        setActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = true
        setUi()
       
        seeAll = false
        CollectionItemDivideTo = 1
//        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideToNext), userInfo: nil, repeats: true)
        pageController.numberOfPages = ARRAY_SpecialsDataModel.count
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        timer?.invalidate()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func setUi(){
        
        
    }
   
    func CollectionsDelegatesCalling(){
        myAppsCollectView.delegate = self
        myAppsCollectView.dataSource = self
        servicesCollectView.delegate = self
        servicesCollectView.dataSource = self
        specialsCollectView.delegate = self
        specialsCollectView.dataSource = self
        promotionsCollectView.delegate = self
        promotionsCollectView.dataSource = self
        //------CellReister
        MyappsCollectonCell.registerCollectionCell(for: myAppsCollectView)
        MyappsCollectonCell.registerCollectionCell(for: servicesCollectView)
        SpecialsCollectionViewCell.registerCollectionCell(for: specialsCollectView)
        MyappsCollectonCell.registerCollectionCell(for: promotionsCollectView)
        
    }
    
    //MARK: - button actions
    @objc func backBtnClicked() {
        navigationController?.popViewController(animated: true)
        
    }
    func setActions(){
        notificationImg.actionBlock {
            self.pushOnly(Controllers.Notifications_VC)
     }
        seeAllLabel.actionBlock {
            if self.CollectionItemDivideTo == 1 && !self.seeAll{
                self.CollectionItemDivideTo = 2

                self.myAppsViewHeight.constant = self.myAppsCollectView.frame.height * 1.2
                
                self.seeAllLabel.isHidden = true
                self.view.setNeedsLayout()

            }
        }
        userImage.actionBlock {
            self.sideMenuController?.revealMenu()

        }
        completeKycView.actionBlock {
            self.pushOnly(Controllers.UpdateKYC_VC)
        }
        
        phoneVerifiedView.actionBlock {
            let storyboard = UIStoryboard(name: StoryboardId.main, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: Controllers.phoneVerified_VC) as! phoneVerified_VC
            self.navigationController?.pushViewController(controller, animated: true)

        }
    }
    func addKycPopUp() {
            completeKyc = CompleteKYCView()
            completeKyc.btn_Skip.actionBlock { [weak self] in
                guard let self = self else { return }
               
                self.completeKyc.removeFromSuperview()
                self.addSkipPopup()
            }
            completeKyc.btn_Verfiy.actionBlock { [weak self] in
                guard let self = self else { return }
                self.pushOnly(Controllers.UpdateKYC_VC)
                self.completeKyc.removeFromSuperview()
   
            }
            self.completeKyc.frame = (self.navigationController?.view.frame)!
            //self.tabBarController?.view.addSubview(self.completeKyc)
            self.navigationController?.view.addSubview(self.completeKyc)
        }
    
    
    func addSkipPopup(){
        skipKycView = SkipKYCView()
        skipKycView.btn_Ok.actionBlock { [weak self] in
            guard let self = self else { return }
            self.skipKycView.removeFromSuperview()
        }
        skipKycView.btn_Cancel.actionBlock { [weak self] in
            guard let self = self else { return }
            self.skipKycView.removeFromSuperview()
            self.addKycPopUp()
        }
        self.skipKycView.frame = (self.navigationController?.view.frame)!
        //self.tabBarController?.view.addSubview(self.completeKyc)
        self.navigationController?.view.addSubview(self.skipKycView)
    }
        
   
    
        
    }
  
extension DashboardViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case myAppsCollectView:
            return ARRAY_MyAppDataModel.count
        case servicesCollectView:
            return ARRAY_ServicesDataModel.count
        case specialsCollectView:
            return ARRAY_SpecialsDataModel.count
        case promotionsCollectView:
            return ARRAY_PromotionsDataModel.count
        default:
            return 5
        }
    }
    // MARK: -  Cell For Row At
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            switch collectionView {
        case myAppsCollectView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.MyappsCollectonCell, for: indexPath) as! MyappsCollectonCell
                cell.iconImage.image = UIImage(named: "\(ARRAY_MyAppDataModel[indexPath.row].iconImage)")
                cell.titleLbl.text = ARRAY_MyAppDataModel[indexPath.row].title
            return cell
        case servicesCollectView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.MyappsCollectonCell, for: indexPath) as! MyappsCollectonCell
                cell.iconImage.image = UIImage(named: "\(ARRAY_ServicesDataModel[indexPath.row].iconImage)")
                cell.titleLbl.text = ARRAY_ServicesDataModel[indexPath.row].title
                return cell
        case specialsCollectView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.SpecialsCollectionViewCell, for: indexPath) as! SpecialsCollectionViewCell
                cell.speclImgView.image = UIImage(named: "\(ARRAY_SpecialsDataModel[indexPath.row].iconImage)")
//                cell.titleLbl.text = ARRAY_ServicesDataModel[indexPath.row].title
                return cell
        case promotionsCollectView:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.MyappsCollectonCell, for: indexPath) as! MyappsCollectonCell
                cell.iconImage.image = UIImage(named: "\(ARRAY_PromotionsDataModel[indexPath.row].iconImage)")
                cell.titleLbl.text = ARRAY_PromotionsDataModel[indexPath.row].title
                return cell
        default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.MyappsCollectonCell, for: indexPath) as! MyappsCollectonCell
                
                return cell
        }
        
        
    }
    // MARK: -  Cell Height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case specialsCollectView:
            return CGSize(width: specialsCollectView.frame.width, height: specialsCollectView.frame.height)
        case myAppsCollectView:
            return CGSize(width: myAppsCollectView.frame.width / 3.3, height: myAppsCollectView.frame.height / CollectionItemDivideTo)
        case promotionsCollectView:
            return CGSize(width: promotionsCollectView.frame.width / 3.3, height: promotionsCollectView.frame.height)
        default:
            return CGSize(width: servicesCollectView.frame.width / 3.3, height: servicesCollectView.frame.height)
        }
    }
    // MARK: -  Cell SPaceings
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch collectionView {
        case specialsCollectView:
           return 2
        default:
            return 5
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case specialsCollectView:
           return 2
        default:
            return 5
        }
        
 
    }
    
    // MARK: -   CollectionView DidSelectItems
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case myAppsCollectView:
            switch indexPath.row {
            case 0:
                self.pushOnly(Controllers.MasterCard_VC)
            case 1:
                self.pushOnly(Controllers.MyVallet_VC)
            case 2:
                self.pushOnly(Controllers.SendMoneyMethodsViewController)
            case 3:
                self.pushOnly(Controllers.TransactionHistory_VC)
            default:
                break
            }
        case servicesCollectView:
            switch indexPath.row {
            case 0:
                print("Currently Electricity bills not Available ")
            case 1:
                print("CurrentlyMobile Recharge bills not Available ")
            default:
                break
            }
        case specialsCollectView:
            switch indexPath.row {
            case 0:
                print("not Available ")
            case 1:
                print("not Available ")
            case 2:
                print(" not Available ")
          
            default:
                break
            }
        case promotionsCollectView:
            switch indexPath.row {
            case 0:
                self.pushOnly(Controllers.ReferandEarn_VC)
            default:
                break
            }
        default:
          break
        }
      
    }
    
    
    
    
    // MARK: -  Special CollectionView Scrolling Handel
    @objc func slideToNext()
       {
           if currentcellIndex < ARRAY_SpecialsDataModel.count-1
           {
               currentcellIndex = currentcellIndex + 1
           }
           else
           {
               currentcellIndex = 0
           }
           pageController.currentPage = currentcellIndex
           specialsCollectView.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0),at:.centeredHorizontally,animated: true)
       }
       
  
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            var visibleRect = CGRect()
            visibleRect.origin = specialsCollectView.contentOffset
            visibleRect.size = specialsCollectView.bounds.size
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard specialsCollectView.indexPathForItem(at: visiblePoint) != nil else { return }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: self.specialsCollectView.contentOffset, size: self.specialsCollectView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = self.specialsCollectView.indexPathForItem(at: visiblePoint) {
            self.pageController.currentPage = visibleIndexPath.row
        }
       
    }
   
}
