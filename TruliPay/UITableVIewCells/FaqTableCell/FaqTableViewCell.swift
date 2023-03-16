//
//  FaqTableViewCell.swift
//  MIM
//
//  Created by APPLE on 29/10/21.
//

import UIKit

class FaqTableViewCell: AbstractTblCell {

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_description: UILabel!
    @IBOutlet weak var btn_errow: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func updateWith(_ model: Any, _ row: Int, _ arrayCount: Int) {
        if let mdl = model as? FAQ_Model {
            lbl_title.text = mdl.titleText
            lbl_description.text = mdl.answers
//            lbl_description.text = "\(mdl.question ?? "")\n\n \(mdl.answer ?? "")"
        }
       
       // print("value in model = ",model)
    }
}
//if let mdl = model as? DataBenificiaryAccount {
//    imgView_UserHeight.constant = 0
//    imgView_UserWidth.constant = 0
//    lbl_Name.text = mdl.bank_holder_name
//    imgView_Delete.actionBlock { [weak self] in
//        guard let self = self else { return }
//        self.delegate.deleteTblCell(mdl, self)
//    }
//}
