//
//  ArriveTableVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 23..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class ArriveTableVC: UITableViewController, APIService {
    let subwayStation = ["역곡역","고려대역","남한산성입구역","오리역","잠실역"]
    
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
        if section == 0 {
            return 1
        } else {
            return subwayStation.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArriveTableCell1.reuseIdentifier, for: indexPath) as! ArriveTableCell1
            
            // cell.nearsearchBtn.addTarget(self, action: #selector(tappedsearchBtn(_:)), for: .touchUpInside)
            
            cell.selectionStyle = .none
            
            return cell
            
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ArriveTableCell2.reuseIdentifier, for: indexPath) as! ArriveTableCell2
            
            cell.stationLabel.text = subwayStation[indexPath.row]
            cell.selectionStyle = .none
            
            
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
        if indexPath.section != 0 {
            let LastTimeTableVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "LastTimeTableVC") as! LastTimeTableVC
            
            //ArriveVC.selectedStore = subwayStation[indexPath.row]
            self.navigationController?.pushViewController(LastTimeTableVC, animated: true)
      
        }
    }

}
