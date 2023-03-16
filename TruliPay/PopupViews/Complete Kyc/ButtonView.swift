//
//  ButtonView.swift
//  TruliPay
//
//  Created by Mobile on 18/04/22.
//

import UIKit
class ButtonView: UIView {

    @IBOutlet weak var contentView: UIView!
  
    @IBOutlet weak var btn_Save: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setupView()
     }
    
    func setupView() {
        Bundle.main.loadNibNamed("ButtonView", owner: self, options: nil)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        btn_Save.layer.cornerRadius = btn_Save.bounds.height/2
        btn_Save.clipsToBounds = true
        
//        DispatchQueue.main.async {
//            self.btn_Verfiy.gradientView(AppColor.gradient1, AppColor.gradient2)
//        }

    }

}
