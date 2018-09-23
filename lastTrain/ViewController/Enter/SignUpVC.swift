//
//  SignUpVC.swift
//  lastTrain
//
//  Created by 양어진 on 2018. 9. 22..
//  Copyright © 2018년 양어진. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, APIService {
    
    let user_id : String = "user_id"
    let user_pw : String = "user_pw"

    var keyboardDismissGesture: UITapGestureRecognizer?
    @IBOutlet weak var idTxt: UITextField!
    @IBOutlet weak var pwTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pwTxt.isSecureTextEntry = true
       
        pwTxt.addTarget(self, action: #selector(isValid), for: .editingChanged)
        idTxt.addTarget(self, action: #selector(isValid), for: .editingChanged)
        emailTxt.addTarget(self, action: #selector(isValid), for: .editingChanged)
        nameTxt.addTarget(self, action: #selector(isValid), for: .editingChanged)
        
        signupBtn.isEnabled = false
        signupBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        signupBtn.addTarget(self, action: #selector(joinBtnClick(_:)), for: UIControlEvents.touchUpInside)
        
    }

    @objc func joinBtnClick(_ sender:UIButton){
        
        let params: [String:Any] = [
            user_id : gsno(idTxt.text),
            user_pw : gsno(pwTxt.text)
        ]
        
        JoinService.shareInstance.join(url: url("/auth"), params: params, completion: { [weak self] (result) in
            guard let `self` = self else { return }
            
            switch result {
            case .networkSuccess(_):
                self.simpleAlertwithHandler(title: "성공", message: "회원가입 성공!", okHandler: self.joinOkHandler(_:))
                break
            case .duplicated :
                self.simpleAlert(title: "오류", message: "존재하는 아이디입니다")
                break
            case .nullValue :
                self.simpleAlert(title: "오류", message: "빈 값이 들어갑니다")
            case .serverErr :
                self.simpleAlert(title: "오류", message: "서버 에러")
            case .networkFail :
                self.networkFailed()
            default :
                break
            }
            
        })
    }

    
    func joinOkHandler(_ sender:UIAlertAction) -> Void {
        self.navigationController?.popViewController(animated: false)
    }
 
    @objc func isValid(){
        if (!(idTxt.text?.isEmpty)! && !(pwTxt.text?.isEmpty)! && !(emailTxt.text?.isEmpty)! && !(nameTxt.text?.isEmpty)!){
            signupBtn.isEnabled = true
            signupBtn.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            
        } else {
            signupBtn.isEnabled = false
            signupBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
    

}

