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
    
    //var buttonOn = false;
    
    let subwayStation = ["역곡역","고려대역","남한산성입구역","오리역","잠실역"]
    var keyboardDismissGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
  
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: StartTableCell1.reuseIdentifier, for: indexPath) as! StartTableCell1
            
                cell.nearsearchBtn.addTarget(self, action: #selector(tappedsearchBtn(_:)), for: .touchUpInside)
                cell.selectionStyle = .none
    
//                cell.searchBtn.tag = indexPath.row
//                cell.searchBtn.addTarget(self, action: "tappedsearchBtn", for: UIControlEvents.touchUpInside)
            
          //  cell.searchBtn
            
//            cell.nickNameLabel.text = boards[indexPath.row]
//            cell.searchTxt.inputView = pickerView
//            cell.searchBtn(<#T##sender: Any##Any#>).inputAccessoryView = bar
            return cell
            
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: StartTableCell2.reuseIdentifier, for: indexPath) as! StartTableCell2

                cell.stationLabel.text = subwayStation[indexPath.row]
                cell.starBtn.setImage(UIImage(named: "starBtn"), for: .normal)
                cell.selectionStyle = .none
//                ///틀려쭘...ㅜㅜㅜㅜㅜ멀까~~~~~~~~~~~~~~~~~???? 자꾸 재사용 돼서 그러는 것 가틈.
//                if buttonOn == false{
//
//                    buttonOn = true;
//                } else {
//                    cell.starBtn.setImage(UIImage(named: "emptyStarBtn"), for: .normal)
//                    buttonOn = false;
//                }
                
            return cell
        }
    }

    @objc func tappedsearchBtn(_ sender : UIButton ){
        if let NearStartTableVC = storyboard?.instantiateViewController(withIdentifier: "NearStartTableVC") as? NearStartTableVC {
            self.navigationController?.pushViewController(NearStartTableVC, animated: true)
        }
        //통신
        
        //        let buttonPosition = sender.convert(CGPoint.zero, to: self.followTableView)
        //        let indexPath: IndexPath? = self.followTableView.indexPathForRow(at: buttonPosition)
        //        let cell = self.followTableView.cellForRow(at: indexPath!) as! FollowCell
        //        // 팔로우가 들어온다는 것은 아직 팔로잉 한 상태가 아니라는 것 => 그러니까 .isSelected = false
        //        //팔로잉이 들어온다는 것은 팔로잉을 하고 있다는것 => 그러니까 .isSelected = true
        //        if sender.isFollow! == "팔로우" {
        //            likeAction(url: url("/user/follow"), userIdx : "\(sender.userIdx!)",  cell : cell, sender : sender )
        //        } else {
        //            dislikeAction(url: url("/user/unfollow/\(sender.userIdx!)"), cell : cell, sender : sender )
        //        }
    }
    
    @objc func tappedstarBtn(_ sender : UIButton ){
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return subwayStation.count
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //테이블 셀 선택했을 때!
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }

}




extension StartTableVC {
    
    //////// 외우지 않아도 되는 부분입니다. 표시된 부분만 고쳐서 사용하세요. ////////
    // 코드 설명 : 키보드가 나올 때 키보드의 높이를 계산해서 댓글 뷰가 키보드 위에 뜰 수 있도록 합니다.
    //          view.frame을 조정하면 키보드가 나오고 들어갈 때 뷰가 움직이게 되겠지요?
    //          notification : 옵저버라고 생각하시면 됩니다. 시점을 캐치하여 #selector()의 액션이 일어나도록 합니다.
    //                          이 코드에서는 키보드가 나올 때, 들어갈 때 의 시점을 캐치하여 뷰의 frame을 조정합니다.
    func setKeyboardSetting() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        adjustKeyboardDismissGesture(isKeyboardVisible: true)
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //////// 키보드의 사이즈만큼 commentSendView의 y축을 위로 이동시킴 ////////
           // commentSendView.frame.origin.y -= keyboardSize.height
            ////////
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        adjustKeyboardDismissGesture(isKeyboardVisible: false)
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            //////// 키보드의 사이즈만큼 commentSendView의 y축을 아래로 이동시킴 ////////
            //commentSendView.frame.origin.y += keyboardSize.height
            ////////
            self.view.layoutIfNeeded()
        }
    }
    
    //화면 바깥 터치했을때 키보드 없어지는 코드
    func adjustKeyboardDismissGesture(isKeyboardVisible: Bool) {
        if isKeyboardVisible {
            if keyboardDismissGesture == nil {
                keyboardDismissGesture = UITapGestureRecognizer(target: self, action: #selector(tapBackground))
                view.addGestureRecognizer(keyboardDismissGesture!)
            }
        } else {
            if keyboardDismissGesture != nil {
                view.removeGestureRecognizer(keyboardDismissGesture!)
                keyboardDismissGesture = nil
            }
        }
    }
    
    @objc func tapBackground() {
        self.view.endEditing(true)
    }
    ////////
}


