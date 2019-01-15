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
    
    func configureCell(_ dataSet: DataSetPerYear?) {
        yearLabel.text = dataSet?.year
        q1DataLabel.text = dataSet?.quarterOneData
        q2DataLabel.text = dataSet?.quarterTwoData
        q3DataLabel.text = dataSet?.quarterThreeData
        q4DataLabel.text = dataSet?.quarterFourData
    }
}
