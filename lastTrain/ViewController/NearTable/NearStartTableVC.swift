//
//  NearStartTableVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 21..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class NearStartTableVC: UITableViewController, APIService {
    //let subwayStation = ["역곡역","고려대역","남한산성입구역","오리역","잠실역"]
    var nearStations : [Near] = []

    let stationx = 37.554648
    let stationy = 126.972559
    
    //let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.nearBoardInit(url : url("/search/here/\(stationx)/\(stationy)"))
        self.nearBoardInit(url : url("/search/here/\(stationx)/\(stationy)"))
        //print(nearStations, "입니다.", stationx)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        //self.nearBoardInit(url : url("/search/here/\(stationx)/\(stationy)"))

    }
    
   
    ////////////////// Network
    
    func nearBoardInit(url : String){
        NearService.shareInstance.nearInit(url: url, completion: { [weak self] (result) in
            guard let `self` = self else { return }
            
            switch result {
            case .networkSuccess(let nearData):
                //print(nearData,"zzzzz")
                self.nearStations = nearData as! [Near]
                self.tableView.reloadData()
                break
                
            case .networkFail :
                self.simpleAlert(title: "network", message: "check")
            default :
                break
            }
        })
    }
    //////////////////
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return nearStations.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "NearStartTabelCell2", for: indexPath)  //identifier가 reuseIdentifier인 것을 cell에 넣어주고 리턴
        
        //cell.textLabel?.text = subwayStation[indexPath.row]
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: NearStartTableCell1.reuseIdentifier, for: indexPath) as! NearStartTableCell1
            
           // cell.locationManager.location?.coordinate.latitude = stationx
          //  cell.locationManager.location?.coordinate.longitude = stationy
            
           // cell.nearsearchBtn.addTarget(self, action: #selector(tappedsearchBtn(_:)), for: .touchUpInside) //버튼액션
            
            cell.selectionStyle = .none
            return cell
            
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: NearStartTableCell2.reuseIdentifier, for: indexPath) as! NearStartTableCell2
            
            cell.configure(station: nearStations[indexPath.row])
            
            
            
            //cell.nearstationLabel.text = nearStations[indexPath.row].station_name
            cell.selectionStyle = .none
            
            return cell
        }

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let ArriveTableVC = UIStoryboard(name: "Main", bundle : nil).instantiateViewController(withIdentifier: "ArriveTableVC") as! ArriveTableVC
            
            //ArriveVC.selectedStore = subwayStation[indexPath.row]
            self.navigationController?.pushViewController(ArriveTableVC, animated: true)
        }
        
    }
    
 
    
}

