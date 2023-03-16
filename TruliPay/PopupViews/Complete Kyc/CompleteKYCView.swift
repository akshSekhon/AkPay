//
//  CompleteKYCView.swift
//  MIM
//
//  Created by APPLE on 09/07/21.
//

import UIKit

class CompleteKYCView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btn_Verfiy: UIButton!
    @IBOutlet weak var btn_Skip: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setupView()
     }
    
    func setupView() {
        Bundle.main.loadNibNamed("CompleteKYCView", owner: self, options: nil)
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        btn_Skip.layer.cornerRadius = btn_Skip.bounds.height/2
        btn_Skip.clipsToBounds = true
        btn_Verfiy.layer.cornerRadius = btn_Verfiy.bounds.height/2
        btn_Verfiy.clipsToBounds = true
//        DispatchQueue.main.async {
//            self.btn_Verfiy.gradientView(AppColor.gradient1, AppColor.gradient2)
//        }

    }

}
