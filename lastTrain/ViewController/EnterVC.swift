//
//  EnterVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 21..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class EnterVC: UIViewController {

    @IBAction func goBtn(_ sender: Any) {
        if let StartTableVC = storyboard?.instantiateViewController(withIdentifier: "StartTableVC") as? StartTableVC {
            
            //push
            self.navigationController?.pushViewController(StartTableVC, animated: true)
            //persent
            //self.navigationController?.show(StartTableVC, sender: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //네비게이션 컨트롤바 
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    

}
