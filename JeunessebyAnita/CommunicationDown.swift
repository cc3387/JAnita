//
//  CommunicationDown.swift
//  JeunessebyAnita
//
//  Created by Clement Chan on 10/22/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Batch
import Firebase

class CommunicationDown:UIViewController{
    
    @IBOutlet weak var communicationboard: UITextView!
    @IBOutlet weak var LowerLevel: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Back: UILabel!
    
    var messages = [String]()
    var time = [String]()
    var loweremail = [String]()
    
    var ref = FIRDatabase.database().reference()
    
    @IBAction func Distributor(_ sender: AnyObject) {
        if(ProfileLogin.joinlink == ""){
            if let url = NSURL(string: "https://joffice.jeunesseglobal.com/signup.asp?locale=zh-US&siteurl=simplyeffective") {
                UIApplication.shared.openURL(url as URL)
            }
        }
        else{
            if let url = NSURL(string: ProfileLogin.joinlink) {
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
    
    override func viewDidLoad() {
        
        if(language == "english"){
            language = "english"
            self.LowerLevel.text = "Share Info"
            self.Description.text = "User can share info here"
            self.Back.text = "Back"
        }
        else if(language == "traditional"){
            language = "traditional"
            self.LowerLevel.text = "資訊分享"
            self.Description.text = "版主可以資訊分享"
            self.Back.text = "回到前頁"
        }
        else if(language == "simplified"){
            language = "simplified"
            self.LowerLevel.text = "资讯分享"
            self.Description.text = "版主可以资讯分享"
            self.Back.text = "回到前页"
        }

        self.communicationboard.text! = "If you have any questions about J.Anita, please note down the following Wechat Accounts to understand more: " + "\n" + "\n" + "Wechat ID: luishiunam" + "\n" + "\n" + "如对J.Anita的产品和营运方式有任何问题，请加微讯:" + "\n" + "\n" + "Wechat ID: luishiunam" + "\n" + "\n" + "了解更多!"
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
};
