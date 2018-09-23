//
//  FromNowOnVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 23..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class FromNowOnVC: UIViewController {

    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBAction func alarmSetBtn(_ sender: Any) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //알람과 소리기능 허가받기
//        let alarmapp = UIApplication.shared
//        let notificationSettings = UIUserNotificationSettings(types: [.alert, .sound], categories: nil)
//        alarmapp.registerUserNotificationSettings(notificationSettings)
//
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
