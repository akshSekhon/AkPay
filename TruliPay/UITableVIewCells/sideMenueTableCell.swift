//
//  sideMenueTableCell.swift
//  TruliPay
//
//  Created by Mobile on 15/04/22.
//

import UIKit

class sideMenueTableCell: AbstractTblCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func updateWith(_ model: Any, _ row: Int, _ arrayCount: Int) {
        if let mdl = model as? SideMenueModel {
            iconImageView.image = UIImage(named: mdl.iconImage)
            titleLbl.text = mdl.title
           
        }
}
}
