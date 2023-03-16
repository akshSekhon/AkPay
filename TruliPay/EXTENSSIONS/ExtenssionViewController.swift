//
//  ExtenssionViewController.swift
//  TruliPay
//
//  Created by Mobile on 07/04/22.
//

import UIKit

extension UIViewController{
    
    func setRoundCorners(view:UIView,boderClr: UIColor = .clear, borderWidth: CGFloat = 0){
        view.layer.cornerRadius = view.bounds.height/2
        view.clipsToBounds = true
        view.layer.borderColor = boderClr.cgColor
        view.layer.borderWidth = borderWidth
        view.layoutSubviews()
        
    }
    
}
    


