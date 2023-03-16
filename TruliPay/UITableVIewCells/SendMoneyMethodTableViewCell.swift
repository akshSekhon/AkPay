//
//  SendMoneyMethodTableViewCell.swift
//  TruliPay
//
//  Created by APPLE on 12/04/22.
//

import UIKit

class SendMoneyMethodTableViewCell: AbstractTblCell {

    @IBOutlet weak var lbl_PaymentName: UILabel!
    @IBOutlet weak var imgVw_Icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func updateWith(_ model: Any, _ row: Int, _ arrayCount: Int) {
        if let mdl = model as? PaymentMethodsModel {
            imgVw_Icon.image = UIImage(named: mdl.iconImage)
            lbl_PaymentName.text = mdl.title
        }
        
//        imgVw_Icon.image = mdl?["iconImage"] as! UIImage
//        lbl_PaymentName.text = mdl?["title"] as! String
        
    }
    
}
