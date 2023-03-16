//
//  AbstractTableViewCell.swift
//  Beautician
//
//  Created by Mobile on 28/05/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import UIKit

protocol TableCellDelegate {
    func updateTblCellModel(_ model: Any,_ cell: AbstractTblCell,_ item: Int)
    func addNewTblCell(_ section: NSInteger)
    func deleteTblCell(_ model: Any,_ cell: AbstractTblCell)
}

extension TableCellDelegate {
    
    func updateTblCellModel(_ model: Any,_ cell: AbstractTblCell,_ item: Int) {
        
    }
    
    func addNewTblCell(_ section: NSInteger) {
        
    }
    
    func deleteTblCell(_ model: Any,_ cell: AbstractTblCell) {
        
    }

}

class AbstractTblCell: UITableViewCell {
    
    var delegate: TableCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateWith(_ model: Any,_ row: Int,_ arrayCount: Int){
        
    }
    
}
