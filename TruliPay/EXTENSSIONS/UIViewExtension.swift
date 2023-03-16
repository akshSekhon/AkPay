//
//  UIViewExtension.swift
//  Infinite BackUp
//
//  Created by Tarun Mehta on 12/14/18.
//  Copyright © 2018 paige. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK:- GradientView
    func gradientView(_ firstColor:UIColor,_ secondColor:UIColor,_ boolLeftToRight:Bool = true) {
        DispatchQueue.main.async {
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = [firstColor.cgColor, secondColor.cgColor]
            gradient.locations = [0.0 , 1.0]
            if boolLeftToRight {
                gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
                gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            }
            self.layer.insertSublayer(gradient, at: 0)
        }
    }

    
    func gradientViewtopToBottom(_ firstColor:UIColor,_ secondColor:UIColor,_ boolTopToBottom:Bool = true) {
        DispatchQueue.main.async {
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = [firstColor.cgColor, secondColor.cgColor]
            gradient.locations = [0.0 , 1.0]
            if boolTopToBottom {
                gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
            }
            self.layer.insertSublayer(gradient, at: 0)
        }
    }

    
    //MARK:- Load Nib
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    //MARK:- Animation
    func provideAnimation(animationDuration:TimeInterval, delayTime:TimeInterval, springDamping:CGFloat, springVelocity:CGFloat){
        self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: animationDuration, delay: delayTime, usingSpringWithDamping: springDamping, initialSpringVelocity: springVelocity, options: .transitionFlipFromTop, animations: {
            self.transform = CGAffineTransform.identity
        })
    }
    
}

extension UIView {
    
    var isAnimating: Bool {
        return layer.animationKeys()!.count > 0
    }
    
    var isVisible: Bool {
        get {
            return !isHidden
        }
        set {
            isHidden = !newValue
        }
    }
    
    func actionBlock(_ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        let recognizer = UITapGestureRecognizer(target: sleeve, action: #selector(ClosureSleeve.invoke))
        addGestureRecognizer(recognizer)
        isUserInteractionEnabled = true
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    func setHidden(_ hidden: Bool, animated: Bool) {
        if !animated {
            isHidden = hidden
        }
        else {
            alpha = isHidden ? 0.0 : 1.0
            isHidden = false
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.alpha = hidden ? 0.0 : 1.0
            }, completion: {(_ finished: Bool) -> Void in
                self.isHidden = hidden
                self.alpha = 1.0
            })
        }
    }
        
    
    func setVisible(_ visible: Bool, animated: Bool) {
        setHidden(!visible, animated: animated)
    }
    
    var control: UIViewController {
        return next as! UIViewController
    }
    
    func addConstraint(_ view1: UIView, view2: UIView, att1: NSLayoutConstraint.Attribute, att2: NSLayoutConstraint.Attribute, mul: CGFloat, const: CGFloat) -> NSLayoutConstraint {
        if view2.responds(to: #selector(setter: self.translatesAutoresizingMaskIntoConstraints)) {
            view2.translatesAutoresizingMaskIntoConstraints = false
        }
        let constraint = NSLayoutConstraint(item: view1, attribute: att1, relatedBy: .equal, toItem: view2, attribute: att2, multiplier: mul, constant: const)
        addConstraint(constraint)
        return constraint
    }
    
    func addConstraint(_ view: UIView, att1: NSLayoutConstraint.Attribute, att2: NSLayoutConstraint.Attribute, mul: CGFloat, const: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: att1, relatedBy: .equal, toItem: view, attribute: att2, multiplier: mul, constant: const)
        addConstraint(constraint)
        return constraint
    }
    
    func addConstraintSameCenterX(_ view1: UIView, view2: UIView) {
        _ = addConstraint(view1, view2: view2, att1: .centerX, att2: .centerX, mul: 1.0, const: 0.0)
    }
    
    func addConstraintSameCenterY(_ view1: UIView, view2: UIView) {
        _ = addConstraint(view1, view2: view2, att1: .centerY, att2: .centerY, mul: 1.0, const: 0.0)
    }
    
    func addConstraintSameHeight(_ view1: UIView, view2: UIView) {
        _ = addConstraint(view1, view2: view2, att1: .height, att2: .height, mul: 1.0, const: 0.0)
    }
    
    func addConstraintSameWidth(_ view1: UIView, view2: UIView) {
        _ = addConstraint(view1, view2: view2, att1: .width, att2: .width, mul: 1.0, const: 0.0)
    }
    
    func addConstraintSameCenterXY(_ view1: UIView, and view2: UIView) {
        _ = addConstraintSameCenterX(view1, view2: view2)
        _ = addConstraintSameCenterY(view1, view2: view2)
    }
    
    func addConstraintSameSize(_ view1: UIView, and view2: UIView) {
        _ = addConstraintSameWidth(view1, view2: view2)
        _ = addConstraintSameHeight(view1, view2: view2)
    }
    
    func addConstraint(for size: CGSize) {
        //        addConstraintForWidth(size.width)
        //        addConstraintForHeight(size.height)
    }
    
    func addConstraintSameAttribute(_ attribute: NSLayoutConstraint.Attribute, subviews: [UIView]) {
        for i in 1..<subviews.count {
            addConstraint(NSLayoutConstraint(item: subviews[0], attribute: attribute, relatedBy: .equal, toItem: subviews[i], attribute: attribute, multiplier: 1.0, constant: 0.0))
        }
    }
    
    func addVisualConstraints(_ constraints: [String], subviews: [String: UIView]) {
        addVisualConstraints(constraints, metrics: nil, forSubviews: subviews)
    }
    
    func addVisualConstraints(_ constraints: [String], metrics: [String: Any]?, forSubviews subviews: [String: UIView]) {
        // Disable autoresizing masks translation for all subviews
        for subview in subviews.values {
            if subview.responds(to: #selector(setter: self.translatesAutoresizingMaskIntoConstraints)) {
                subview.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        // Apply all constraints
        for constraint in constraints {
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: constraint, options: [], metrics: metrics, views: subviews))
        }
    }
    
    func addConstraintToFillSuperview() {
        superview?.addVisualConstraints(["H:|[self]|", "V:|[self]|"], subviews: ["self": self])
    }
    
    func addConstraintForAspectRatio(_ aspectRatio: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: aspectRatio, constant: 0.0)
        addConstraint(constraint)
        return constraint
    }
    
    func addConstraintForWidth(_ width: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: width)
        addConstraint(constraint)
        return constraint
    }
    
    func addConstraintForHeight(_ height: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0.0, constant: height)
        addConstraint(constraint)
        return constraint
    }
    
    func addSubviews(_ subviews: [UIView]) {
        for view in subviews {
            addSubview(view)
        }
    }
    
    var viewToImage: UIImage {
        var image: UIImage?
        if #available(iOS 10.0, *) {
            let format = UIGraphicsImageRendererFormat()
            format.opaque = false
            format.scale = 0.0
            let renderer = UIGraphicsImageRenderer(size: frame.size, format: format)
            image = renderer.image { context in
                drawHierarchy(in: frame, afterScreenUpdates: true)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
            drawHierarchy(in: frame, afterScreenUpdates: true)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return image!
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
    func roundSpecificCorner(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
   
}

extension Dictionary {
    
    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJson() {
        print(json)
    }
    
}
