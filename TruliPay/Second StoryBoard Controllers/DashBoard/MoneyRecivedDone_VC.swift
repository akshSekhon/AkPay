//
//  MoneyRecivedDone_VC.swift
//  TruliPay
//
//  Created by Mobile on 15/04/22.
//

import UIKit

class MoneyRecivedDone_VC: UIViewController {

    @IBOutlet weak var fromImage: UIImageView!
    @IBOutlet weak var inImage: UIImageView!
    @IBOutlet weak var horizotalDashesView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        horizotalDashesView.makeDashedBorderLine(color: .black, strokeLength: horizotalDashesView.frame.height as NSNumber, gapLength: 1, width: 1, orientation: .vertical)
        horizotalDashesView.backgroundColor = .white
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setNavigationBar(vc: self, middleTitle: "Money Received")
        DispatchQueue.main.async {
            self.addDashedBorder(view: self.horizotalDashesView)
            self.view.bringSubviewToFront(self.horizotalDashesView)
        }
       
    }
    func addDashedBorder(view:UIView) {
        //Create a CAShapeLayer
        let lineLayer = CAShapeLayer()
             lineLayer.strokeColor = UIColor.gray.cgColor
             lineLayer.lineWidth = 2
             lineLayer.lineDashPattern = [4,4]
             let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: view.bounds.midX, y: view.bounds.minY),
                                CGPoint(x: view.bounds.midX, y:view.frame.height)])
             lineLayer.path = path
        view.layer.addSublayer(lineLayer)
         }
}

