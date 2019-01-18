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
    @IBOutlet var declineImage: UIButton!
    @IBOutlet var dataUsageLabel: UILabel!
    
    @IBAction func imageClicked(_ sender: Any) {
        let alert = UIAlertController(title: "",
                                      message: StringConstants.DATA_USAGE_DECLINED_BY,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: StringConstants.OK_LABEL,
                                      style: .default,
                                      handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func configureCell(_ dataSet: DataSetPerYear?) {
        if let year = dataSet?.year {
            yearLabel.text = year
        }
        if let dataUsage = dataSet?.dataUsagePerYear {
            dataUsageLabel.text = String(dataUsage)
        }
        if let isUsageDeclined = dataSet?.isUsageDeclined {
            declineImage.isHidden = !isUsageDeclined
        } else {
            declineImage.isHidden = true
        }
    }
}
