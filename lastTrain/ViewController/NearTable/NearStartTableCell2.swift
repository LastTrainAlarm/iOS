//
//  NearStartTableCell2.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 21..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class NearStartTableCell2: UITableViewCell {

    @IBOutlet weak var nearstationLabel: UILabel!
    @IBOutlet weak var starBtn: UIImageView!
    
    
    func configure(station : Near){
        
        nearstationLabel.text = station.station_name
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
