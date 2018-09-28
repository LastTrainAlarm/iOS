//
//  LastTimeTableVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 23..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class LastTimeTableVC: UITableViewController, APIService {
   let timearr = [11,22,33]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        } else {
            return 3
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LastTimeTableCell1.reuseIdentifier, for: indexPath) as! LastTimeTableCell1

            cell.selectionStyle = .none
            
            return cell
            
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: LastTimeTableCell2.reuseIdentifier, for: indexPath) as! LastTimeTableCell2
            let buttonText = String(timearr[indexPath.row]) + "분"
            cell.lasttimeBtn.setTitle(buttonText, for: .normal)
        
            cell.selectionStyle = .none
            
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let FromNowOnVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "FromNowOnVC") as! FromNowOnVC
            
            //ArriveVC.selectedStore = subwayStation[indexPath.row]
            self.navigationController?.pushViewController(FromNowOnVC, animated: true)
            
        }
    }


}
