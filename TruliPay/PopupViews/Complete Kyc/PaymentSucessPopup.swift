//
//  PaymentSucessPopup.swift
//  TruliPay
//
//  Created by Mobile on 19/04/22.
//

import UIKit

class PaymentSucessPopup: UIView {

    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btn_Ok: UIButton!
    @IBOutlet weak var paymentLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setupView()
     }
    
    func setupView() {
        Bundle.main.loadNibNamed("PaymentSucessPopup", owner: self, options: nil)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        btn_Ok.layer.cornerRadius = btn_Ok.bounds.height/2
        btn_Ok.clipsToBounds = true
        checkImage.layer.cornerRadius = checkImage.frame.height/2
        checkImage.layer.borderWidth = 4
        checkImage.layer.borderColor = UIColor.white.cgColor
        checkImage.clipsToBounds = true
        
       //        DispatchQueue.main.async {
//            self.btn_Verfiy.gradientView(AppColor.gradient1, AppColor.gradient2)
//        }

    }
}
