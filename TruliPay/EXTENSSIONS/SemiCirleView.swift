//
//  CurvedView.swift
//  MyAirtel
//
//  Created by MAC SOLUTIONSS on 16/12/21.
//

import UIKit

class SemiCirleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let rect = bounds
        let y = rect.size.height - 80.0
        let curveTo = rect.size.height

        let myBez = UIBezierPath()
        myBez.move(to: CGPoint(x: 0.0, y: y))
        myBez.addQuadCurve(to: CGPoint(x: rect.size.width, y: y), controlPoint: CGPoint(x: rect.size.width / 2.0, y: curveTo))
        myBez.addLine(to: CGPoint(x: rect.size.width, y: 0.0))
               myBez.addLine(to: CGPoint(x: 0.0, y: 0.0))
               myBez.close()

               let maskForPath = CAShapeLayer()
               maskForPath.path = myBez.cgPath
               layer.mask = maskForPath
        
    }
        
}
class RoundedButtonWithShadow: UIButton {
    
    let mycolor = UIColor(named: AppColor.grayBorderColor)
   
    let Color = UIColor(red: 242/255, green: 237/255, blue: 243/255, alpha: 1)
    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.bounds.height/2).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
//            shadowLayer.borderColor = Color.cgColor
//            shadowLayer.borderWidth = 1
            shadowLayer.shadowColor = UIColor.lightGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0, height: 0)
            shadowLayer.shadowOpacity = 0.5
            shadowLayer.shadowRadius = 1

            layer.insertSublayer(shadowLayer, at: 0)
            //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }
}
