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
    let userId : String = "user_id"
    let userPw : String = "user_pwd"
    let userDefault = UserDefaults.standard
    var userData : LoginVOData?
    
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
            userId : gsno(idTxt.text),
            userPw : gsno(pwTxt.text)
        ]
        
        //network
        
        LoginService.shareInstance.loginInit(url: url("/auth/login"), params: params, completion: { [weak self] (result) in
            guard let `self` = self else { return }
            
            switch result {
            case .networkSuccess (let loginData) : //(let userIdx):
                //self.userDefault.set((userIdx as? Int), forKey: "userIdx")
                //self.userDefault.set(self.idTxt.text, forKey: "userId")
                self.userData = loginData as? LoginVOData
                self.userDefault.set(self.userData?.userIdx, forKey: "userIdx")
               //self.userDefault.set(self.userData?.token, forKey : "userToken")
           
                
                //메인페이지로
                let VCNavi = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navi")
                self.present(VCNavi, animated: true, completion: nil)
                
                
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
        
        /*
        if let StartTableVC = storyboard?.instantiateViewController(withIdentifier: "StartTableVC") as? StartTableVC {
            
            //push
            self.navigationController?.pushViewController(StartTableVC, animated: true)
            //persent
            //self.navigationController?.show(StartTableVC, sender: true)
        }
 */
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //네비게이션 컨트롤바 
        self.navigationController?.navigationBar.isHidden = false
        self.pwTxt.text = ""
        self.idTxt.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pwTxt.isSecureTextEntry = true
    }

    

}


