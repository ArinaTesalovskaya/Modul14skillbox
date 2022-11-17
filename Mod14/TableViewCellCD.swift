//
//  TableViewCell.swift
//  Mod14
//
//  Created by Arina Tesalovskaya on 05.04.2022.
//

import UIKit
import CoreData

class TableViewCellCoreData: UITableViewCell {
    @IBOutlet weak var NameSecondname: UILabel!
        @IBOutlet weak var DateTime: UILabel!
        @IBOutlet weak var TaskText: UITextView!
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
    }
