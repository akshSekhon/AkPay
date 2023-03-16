//
//  NotificationTableCell.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit

class NotificationTableCell: AbstractTblCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var ammountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.layer.cornerRadius = userImage.bounds.height/2
        userImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func updateWith(_ model: Any, _ row: Int, _ arrayCount: Int) {
        if let mdl = model as? NotificationModel {
            userImage.image = UIImage(named: mdl.iconimage)
            userNameLabel.text = mdl.userName
            ammountLabel.text = mdl.ammount
        }
}
}
