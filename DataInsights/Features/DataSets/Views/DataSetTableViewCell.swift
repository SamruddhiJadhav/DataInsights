//
//  YearTableViewCell.swift
//  DataInsights
//
//  Created by Jadhav, Samruddhi on 14/01/19.
//  Copyright © 2019 Jadhav, Samruddhi. All rights reserved.
//

import UIKit

class DataSetTableViewCell: UITableViewCell {
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var q1DataLabel: UILabel!
    @IBOutlet var q2DataLabel: UILabel!
    @IBOutlet var q3DataLabel: UILabel!
    @IBOutlet var q4DataLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ dataSet: DataSetPerYear?) {
        yearLabel.text = dataSet?.year ?? ""
        q1DataLabel.text = "quarter1"
        q2DataLabel.text = "quarter2"
        q3DataLabel.text = "quarter3"
        q4DataLabel.text = "quarter4"
    }
}
