//
//  TransictionTableCell.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit

class TransictionTableCell: AbstractTblCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var moneyStatusLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImage.layer.cornerRadius = iconImage.bounds.height/2
        iconImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func updateWith(_ model: Any, _ row: Int, _ arrayCount: Int) {
        if let mdl = model as? NotificationModel {
            iconImage.image = UIImage(named: mdl.iconimage)
            userNameLbl.text = mdl.userName
            moneyStatusLbl.text = mdl.ammount
        }
}
}
