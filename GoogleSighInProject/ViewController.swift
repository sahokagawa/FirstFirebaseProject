//
//  ViewController.swift
//  GoogleSighInProject
//
//  Created by 香川紗穂 on 2019/08/07.
//  Copyright © 2019 香川紗穂. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//グーグルの処理ができるように拡張
extension ViewController: GIDSignInDelegate, GIDSignInUIDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//  ボタンとプログラム繋げなくても大丈夫
        
//エラーの確認をする（サインインの設定のエラー）　　　！だとnilのときエラーでるからif let構文で。
        if let error = error {
//            errorがnilでない場合（エラーがある場合）
            print("Google Sign Inでエラーが発生しました")
            print(error.localizedDescription)   //エラーの情報が観れる
            return    //処理中断
        }
        
//Googleサインインの準備をする（トークンの取得、ユーザー情報の取得）
//     ユーザー情報取得
        let authentication = user.authentication
//        Googleのトークン取得
        let credential = GoogleAuthProvider.credential(withIDToken: authentication!.idToken, accessToken: authentication!.accessToken)
        //Googleでログインする。Firebaseにログイン情報を書き込む
        Auth.auth().signIn(with: credential) { (authDataResult, error) in
            
            if let error = error {
                print("失敗")
                print(error.localizedDescription)
            } else {
                print("成功")
            }
            
        }
    
    }
    
    
}

