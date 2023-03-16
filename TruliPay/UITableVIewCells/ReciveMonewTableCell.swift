//
//  ReciveMonewTableCell.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit

class ReciveMonewTableCell: AbstractTblCell {

    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var accountLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func updateWith(_ model: Any, _ row: Int, _ arrayCount: Int) {
        if let mdl = model as? ReciveMoneyInModel {
            checkImageView.image = UIImage(named: mdl.iconimage)
            accountLbl.text = mdl.paymentType
        }
    
}
}
