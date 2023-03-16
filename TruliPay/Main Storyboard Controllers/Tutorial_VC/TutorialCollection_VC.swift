//
//  TutorialCollection_VC.swift
//  TruliPay
//
//  Created by MAC SOLUTIONSS on 11/04/22.
//

import UIKit

class TutorialCollection_VC: UIViewController {
    
    @IBOutlet weak var getStartButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipBtn: UIButton!
    
    @IBOutlet weak var nextButtonsBaseView: UIView!
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var tutorialColllectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TutorialCollectionViewCell.registerCollectionCell(for: tutorialColllectionView)
//        tutorialColllectionView.register(UINib(nibName: "TutorialCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TutorialCollectionViewCell")
        pageController.currentPage = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true

        viewButtonsHide()
        
    }
    
    
    @IBAction func buttonActions(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
//            self.pushOnly(Controllers.Login_VC)
            
//            self.pushOnly(Controllers.Login_VC)
            let vc = self.storyboard?.instantiateViewController(identifier: Controllers.Login_VC) as! Login_VC
            vc.newUserLogin = true
            vc.userTypeNew = true
            self.navigationController?.pushViewController(vc, animated: true)
         //   self.navigationController?.popToRootViewController(animated: true)
            
//            let nextItem: IndexPath = IndexPath(item: 2, section: 0)
//            self.tutorialColllectionView.scrollToItem(at: nextItem, at: .left, animated: true)
//            pageController.currentPage = nextItem.row
            
//            let visibleItems: NSArray = self.tutorialColllectionView.indexPathsForVisibleItems as NSArray
//               let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
//               let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
//                      if nextItem.row < 3 {
//                   self.tutorialColllectionView.scrollToItem(at: nextItem, at: .left, animated: true)
//                          pageController.currentPage = nextItem.row
//               }
        case 1:
            let visibleItems: NSArray = self.tutorialColllectionView.indexPathsForVisibleItems as NSArray
               let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
               let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
               if nextItem.row < 3 && nextItem.row >= 0{
                   self.tutorialColllectionView.scrollToItem(at: nextItem, at: .right, animated: true)
                   pageController.currentPage = nextItem.row
               }
        default:
            break
        }
        viewButtonsHide()
    }
    @IBAction func GetstartBtnAction(_ sender: UIButton) {
//        self.pushOnly(Controllers.Login_VC)
        let vc = self.storyboard?.instantiateViewController(identifier: Controllers.Login_VC) as! Login_VC
        vc.newUserLogin = true
        vc.userTypeNew = true
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func viewButtonsHide(){
        if pageController.currentPage == 2{
            nextButtonsBaseView.isHidden = true
            getStartButton.isHidden = false
        }
        else{
            nextButtonsBaseView.isHidden = false
            getStartButton.isHidden = true
        }
    }

}
extension TutorialCollection_VC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tutorialColllectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCollectionViewCell", for: indexPath) as! TutorialCollectionViewCell
        cell.titleLabel.text = AppStrings.tutorialtitlesTxtArr[indexPath.row]
        cell.discriptionLabel.text = AppStrings.tutorialDiscriptTxtArr[indexPath.row]
        cell.logoImage.image = UIImage(named: Images.tutorialImgArr[indexPath.row])
        
        cell.discriptionLabel.setTextWithLineSpacing(label: cell.discriptionLabel, text: AppStrings.tutorialDiscriptTxtArr[indexPath.row], lineSpacing: 5)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: tutorialColllectionView.frame.width, height: tutorialColllectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        viewButtonsHide()
    }
    
}
