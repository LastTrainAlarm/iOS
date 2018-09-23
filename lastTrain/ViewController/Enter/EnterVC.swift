//
//  EnterVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 21..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class EnterVC: UIViewController, APIService {

    @IBOutlet weak var idTxt: UITextField!
    @IBOutlet weak var pwTxt: UITextField!
    
    var keyboardDismissGesture: UITapGestureRecognizer?
    let user_id : String = "user_id"
    let user_pw : String = "user_pw"
    let userDefault = UserDefaults.standard
    
    @IBAction func signupBtn(_ sender: Any) {
        if let SignUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC {
            self.navigationController?.pushViewController(SignUpVC, animated: true)
        }
    }
        
    @IBAction func goBtn(_ sender: Any) {
        
        if (idTxt.text?.isEmpty)! || (pwTxt.text?.isEmpty)! {
            simpleAlert(title: "로그인 실패", message: "모든 항목을 입력해 주세요")
            return
        }
        
        let params: [String:Any] = [
            user_id : gsno(idTxt.text),
            user_pw : gsno(pwTxt.text)
        ]
        
        //network
        
        LoginService.shareInstance.login(url: url("/auth/signin"), params: params, completion: { [weak self] (result) in
            guard let `self` = self else { return }
            
            switch result {
            case .networkSuccess(let user_id):
                self.userDefault.set((user_id as? Int), forKey: "user_id")
                self.userDefault.set(self.idTxt.text, forKey: "user_id")
                
//                let boardVCNavi = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navi")
//                self.present(boardVCNavi, animated: true, completion: nil)
                break
            case .wrongInput :
                self.simpleAlert(title: "오류", message: "아이디와 비밀번호를 확인해주세요")
                break
            case .nullValue :
                self.simpleAlert(title: "오류", message: "빈 값이 들어갑니다")
            case .serverErr :
                self.simpleAlert(title: "오류", message: "서버 에러")
            case .networkFail :
                self.simpleAlert(title: "오류", message: "인터넷 연결상태를 확인해주세요")
            default :
                break
            }
        })
        
        
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
        self.pwTxt.isSecureTextEntry = true
    }

    

}


