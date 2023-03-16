//
//  CellRegisterExtenssions.swift
//  TruliPay
//
//  Created by Mobile on 14/04/22.
//

import UIKit
//-- TABELVIEW CELL REGISTERATION
extension UITableViewCell {
    
    static func registerTableCell(for tableView: UITableView)  {
        let cellName = String(describing: self)
        let cellIdentifier = cellName
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
    }
    
}
//-- COLLECTION CELL REGISTER
extension UICollectionViewCell {
    static func registerCollectionCell(for collectnView: UICollectionView)  {
        let cellName = String(describing: self)
        let cellIdentifier = cellName
        let cellNib = UINib(nibName: String(describing: self), bundle: nil)
        collectnView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
        
    }

}
