//
//  TutorialCollectionViewCell.swift
//  
//
//  Created by MAC SOLUTIONSS on 11/04/22.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
}
extension UILabel
{
    func setTextWithLineSpacing(label:UILabel,text:String,lineSpacing:CGFloat)
    {
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.alignment = .center
        
        let attrString = NSMutableAttributedString(string: text)
    
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
                

        label.attributedText = attrString
    }
        
    
}
