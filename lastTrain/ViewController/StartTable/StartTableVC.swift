//
//  StartTableVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 21..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StartTableVC: UITableViewController {
    
    let subwayStation = ["역곡역","고려대역","남한산성입구역","오리역","잠실역"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StartTableCell1.reuseIdentifier) as! StartTableCell1
            
          //  cell.searchBtn
            
//            cell.nickNameLabel.text = boards[indexPath.row]
//            cell.searchTxt.inputView = pickerView
//            cell.searchBtn(<#T##sender: Any##Any#>).inputAccessoryView = bar
            return cell
            
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: StartTableCell2.reuseIdentifier) as! StartTableCell2
//            cell.addBtn.addTarget(self, action: #selector(addTextField), for: UIControlEvents.touchUpInside)
//            cell.registerBtn.addTarget(self, action: #selector(registerStoreBtn), for: UIControlEvents.touchUpInside)
        
            
            return cell
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return subwayStation.count
        }
    }
    
    
    //테이블 셀 선택했을 때!
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
 
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
