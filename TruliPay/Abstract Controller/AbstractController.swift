//
//  AbstractController.swift
//  Beautician
//
//  Created by Aman on 28/05/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire

class AbstractController: UIViewController, TableCellDelegate, CollectionCellDelegate {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVw: UITableView!
 
    @IBOutlet weak var collectionVw: UICollectionView!
    
    //MARK:- Variables
    //TableView
    var arrayTblItems = [Any]() {
        didSet{
            if tblVw != nil{
                tblVw.reloadData()
            }
        }
    }
    
    var tblCell: AbstractTblCell.Type {
        return AbstractTblCell.self
    }
    
    var tblReuseId: String {
        return String(describing: tblCell.self)
    }
    
    var multipleTableSection: Bool {
        return false
    }
    
    //CollectionView
    var arrayCollectionItems = [Any]() {
        didSet{
            if collectionVw != nil{
                collectionVw.reloadData()
            }
        }
    }
    
    var multipleCollectionSection: Bool {
        return false
    }
    
    var collectionCell: AbstractCollectionCell.Type {
        return AbstractCollectionCell.self
    }
    
    var collectionReuseId: String {
        return String(describing: collectionCell.self)
    }
    
//    Navigation Bar
    var navTitle: String {
        return Constants.empty
    }
    
   
    
    var isHomenavTitle: String {
        return Constants.empty
    }
    
    var backBtn: Bool {
        return true
    }
    
    var rightBtns:[String] {
        return []
    }
    
    var backgroundImage : Bool {
        return true
    }
    
    var badgeNumber: [Int] {
        return []
    }
    
    //Location
    var isShowingCurrentLocation : Bool {
        return true
    }
        
    //RefreshControl
    var isRefreshController:Bool {
        return true
    }
    
    var isCollectionViewRefreshController:Bool {
        return true
    }
    
    var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    //MARK:- Google Map
    var rightButton = UIBarButtonItem()
    let refreshControl = UIRefreshControl()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if tblVw != nil {
            if isRefreshController {
                self.tblVw.addSubview(refreshControl)
                refreshControl.attributedTitle = NSAttributedString(string: Constants.fetchingData)
                refreshControl.addTarget(self, action: #selector(refreshListViewController), for: .valueChanged)
            }
            tblVw.register(UINib(nibName: tblReuseId, bundle: nil), forCellReuseIdentifier: tblReuseId)
            tblVw.dataSource = self
            tblVw.delegate = self
            tblVw.separatorStyle = .none
            tblVw.showsVerticalScrollIndicator = false
            tblVw.showsHorizontalScrollIndicator = false
            tblVw.tableFooterView = UIView()
        }
        if collectionVw != nil {
            if isCollectionViewRefreshController {
                self.collectionVw.addSubview(refreshControl)
                refreshControl.attributedTitle = NSAttributedString(string: Constants.fetchingData)
                refreshControl.addTarget(self, action: #selector(refreshListViewController), for: .valueChanged)
            }
            collectionVw.register(UINib(nibName: collectionReuseId, bundle: nil), forCellWithReuseIdentifier: collectionReuseId)
            collectionVw.dataSource = self
            collectionVw.delegate = self
            collectionVw.showsVerticalScrollIndicator = false
            collectionVw.showsHorizontalScrollIndicator = false
        }
//        navigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //MARK: Refresh TableView
    @objc func refreshListViewController() {
        refreshControl.endRefreshing()
    }
    
    
    //MARK:-Navigation Bar
    func navigationBar() {
//        navigationController?.navigationBar.barTintColor = .white
        if self.isHomenavTitle == Constants.zero {
            let label = UILabel()
            label.backgroundColor = .clear
            label.numberOfLines = 2
            label.font = UIFont.boldSystemFont(ofSize: 16.0)
            label.textAlignment = .center
            label.textColor = .black
            label.text = navTitle
            self.navigationController?.visibleViewController?.navigationItem.titleView = label
        } else {
            let logo = UIImage(named: Images.topNavIgationImage)
            let imageView = UIImageView(image:logo)
            imageView.actionBlock { [weak self] in
                guard let self = self else { return }
                self.navClicked()
            }
            self.navigationItem.titleView = imageView
        }
        
        /* Set Left Btn */
        var leftBtn = UIBarButtonItem()
        if backBtn {
            leftBtn = UIBarButtonItem(image: UIImage(named: Images.LeftArrow) , style: .plain, target: self, action: #selector(back(_:)))
        }
        self.navigationItem.leftBarButtonItem = leftBtn
        var rightbtn = [UIBarButtonItem]()
        for (index,imageName) in rightBtns.enumerated() {
            let rightBtn1 = UIButton(type: UIButton.ButtonType.custom)
            rightBtn1.backgroundColor = UIColor.clear
            rightBtn1.frame = CGRect(x: UIScreen.main.bounds.width - 5, y: 0, width: 30, height: 40)
            rightBtn1.setImage(UIImage(named: imageName), for:.normal)
                rightBtn1.tag = index
//            }
            rightBtn1.addTarget(self, action: #selector(rightBtnActn(_:)), for: .touchUpInside)
            self.rightButton = UIBarButtonItem(customView: rightBtn1)
//            if badgeNumber.count >= 1 {
//                if badgeNumber[index] > 0 {
//                    btn.addBadge(number: badgeNumber[index])
//                }
//            }
            rightbtn.append(self.rightButton)
        }
        self.navigationItem.rightBarButtonItems = rightbtn
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func navClicked() {
        
    }
    
    @objc func back(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func menuButnAction() {
        //If there is menu icon on left navigation item
    }
    
    //MARK:- Swipe
    func swipeGestures() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    //MARK:- Actions
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        
    }
    
    //MARK:- Right Bar Button Action
    @objc func rightBtnActn(_ sender: UIBarButtonItem) {

    }
    
    func convertDateToFormat(_ stringDate:String, _ dateFormat:String="yyyy-MM-dd HH:mm:ss", _ getDateFormat:String="d MMM yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: stringDate) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = getDateFormat
            let string = dateFormatter.string(from: date)
            return string
        }
        return "...."
    }

    func localToUTC(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        
        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        //        return dateFormatter.string(from: dt!)
        return "\(Int(dt!.timeIntervalSince1970))"
    }
    
    
    func showLoaderWithText(_ labelText:String="Loading...") {
        UIApplication.appWindow.isUserInteractionEnabled = false
        let Indicator = MBProgressHUD.showAdded(to: UIApplication.appWindow, animated: true)
        Indicator.label.text = labelText
        Indicator.label.numberOfLines = 0
        Indicator.isUserInteractionEnabled = false
        Indicator.show(animated: true)
    }
    
    func hideLoader() {
        UIApplication.appWindow.isUserInteractionEnabled = true
        MBProgressHUD.hide(for: UIApplication.appWindow, animated: true)
    }
    
    func updateTblCellModel(_ model: Any,_ cell: AbstractTblCell,_ item: Int) {
        
    }
    
    func addNewTblCell(_ section: NSInteger) {
        
    }
    
    func deleteTblCell(_ model: Any,_ cell: AbstractTblCell) {
        
    }

    
}

//MARK:- Extension for Table View
extension AbstractController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if multipleTableSection {
            return arrayTblItems.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if multipleTableSection {
            return (arrayTblItems[section] as! [Any]).count
        }
        return arrayTblItems.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: tblCell.self)) as! AbstractTblCell
        cell.delegate = self
        cell.backgroundColor = .clear
        cell.updateWith(arrayTblItems[indexPath.row], indexPath.row, arrayTblItems.count)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
}

//MARK:- Extension for Collection View
extension AbstractController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCollectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: collectionCell.self), for: indexPath) as! AbstractCollectionCell
        cell.delegate = self
        cell.updateWith(arrayCollectionItems[indexPath.item], indexPath.item, arrayCollectionItems.count)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

//MARK:- UITextFieldDelegate
extension AbstractController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == Constants.emptySpace && range.location == 0 {
            return false
        } else {
            return true
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            return true
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
   
}

//MARK:- Dictionary Extension
extension Dictionary {
    var queryString: String {
        var output: String = ""
        for (key,value) in self {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
    }
}

