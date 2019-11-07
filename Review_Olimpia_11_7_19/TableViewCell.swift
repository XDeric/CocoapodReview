//
//  TableViewCell.swift
//  Review_Olimpia_11_7_19
//
//  Created by EricM on 11/7/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class TableViewCell: MGSwipeTableCell {

       lazy var nameLabel: UILabel = {
             let nameLabel = UILabel()
             return nameLabel
         }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
             super.init(style: style, reuseIdentifier: reuseIdentifier)
            addSubview(nameLabel)
             setConstrains()
         
             
         }
         
         required init?(coder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
         }
         
         func setConstrains() {
             nameLabel.translatesAutoresizingMaskIntoConstraints = false
             [nameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor), nameLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)].forEach{ $0.isActive = true }
         }
        
}
