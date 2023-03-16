//
//  TextFieldPaddindClass.swift
//  TruliPay
//
//  Created by Mobile on 09/04/22.
//

import UIKit

class TextFieldWithPadding: UITextField {
//    @IBInspectable var LeftPadding ?
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 20,
        bottom: 0,
        right: 20
    )
    override func layoutSubviews() {
            super.layoutSubviews()
    
            placeholderColor1(color: UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1))
        }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
  
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    func placeholderColor1(color: UIColor) {
               let attributeString = [
                NSAttributedString.Key.foregroundColor: color.withAlphaComponent(1),
                NSAttributedString.Key.font: self.font!
               ] as [NSAttributedString.Key : Any]
               self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
           }
}

class PickerTextField: UITextField {
//    @IBInspectable var LeftPadding ?
   
    @IBInspectable var leftSpace: CGFloat = 20
    @IBInspectable var RightSpace: CGFloat = 20
    @IBInspectable var TopSpace: CGFloat = 0
    @IBInspectable var BottomSpace: CGFloat = 0

    
    override func layoutSubviews() {
            super.layoutSubviews()
    
            placeholderColor1(color: UIColor(red: 116/255, green: 116/255, blue: 116/255, alpha: 1))
        }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by:  UIEdgeInsets(top: TopSpace, left: leftSpace, bottom: BottomSpace, right: RightSpace))
        
    }
 
    public override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: UIEdgeInsets(top: TopSpace, left: leftSpace, bottom: BottomSpace, right: RightSpace))
    }
    func placeholderColor1(color: UIColor) {
               let attributeString = [
                NSAttributedString.Key.foregroundColor: color.withAlphaComponent(1),
                NSAttributedString.Key.font: self.font!
               ] as [NSAttributedString.Key : Any]
               self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
           }
}

extension UITextField{
    
    func setRightViewIcon( VC : UIViewController,icon: UIImage,buttonAction: Selector) {
        let dropdownButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: self.frame.height))
        dropdownButton.backgroundColor = .clear
        dropdownButton.setImage(icon, for: UIControl.State())
        dropdownButton.addTarget(VC, action: buttonAction, for: .touchUpInside)
       
        let container = UIView(frame: dropdownButton.frame)
        container.backgroundColor = .clear
        container.addSubview(dropdownButton)
        self.rightView = container
        self.rightViewMode = .always
    }
    
    @objc func btnAction(){
        print("Button Tapped")
        
    }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    func placeholderColor(color: UIColor) {
               let attributeString = [
                NSAttributedString.Key.foregroundColor: color.withAlphaComponent(1),
                NSAttributedString.Key.font: self.font!
               ] as [NSAttributedString.Key : Any]
               self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
           }
}
