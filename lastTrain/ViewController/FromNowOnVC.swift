//
//  FromNowOnVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 23..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit
import Foundation

class FromNowOnVC: UIViewController {

    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!
    @IBAction func alarmSetBtn(_ sender: Any) {
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //알람과 소리기능 허가받기
//        let alarmapp = UIApplication.shared
//        let notificationSettings = UIUserNotificationSettings(types: [.alert, .sound], categories: nil)
//        alarmapp.registerUserNotificationSettings(notificationSettings)
//
        var date = Date()
        var cal = Calendar.current
        
        var currentMin = cal.component(.minute, from: date)
        var currentSec = cal.component(.second, from: date)
        

        minLabel.text = String(currentMin)
        secLabel.text = String(currentSec)
        
        
        
    }
 
   

}
