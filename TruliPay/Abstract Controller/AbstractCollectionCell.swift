//
//  AbstractCollectionViewCell.swift
//  Beautician
//
//  Created by Mobile on 28/05/19.
//  Copyright © 2019 Mobile. All rights reserved.
//

import UIKit

protocol CollectionCellDelegate {
    func updateCollectionCellModel(_ model: Any,_ cell: AbstractCollectionCell,_ item: Int)
    func addNewCollectionCell(_ section: NSInteger)
    func deleteCollectionCell(_ cell: AbstractCollectionCell)
}

extension CollectionCellDelegate {
    
    func updateCollectionCellModel(_ model: Any,_ cell: AbstractCollectionCell,_ item: Int) {
        
    }
    
   func addNewCollectionCell(_ section: NSInteger) {
        
    }
    
    func deleteCollectionCell(_ cell: AbstractCollectionCell) {
        
    }
}

class AbstractCollectionCell: UICollectionViewCell {
    
    var delegate: CollectionCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateWith(_ model: Any,_ item: Int,_ count: Int){
        
    }
    
}
