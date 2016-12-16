//
//  Communication.swift
//  JeunessebyAnita
//
//  Created by Clement Chan on 10/22/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Batch
import Firebase

class CommunicationUp:UIViewController{

    @IBOutlet weak var UpperLevel: UILabel!
    @IBOutlet weak var communicationboard: UITextView!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Back: UILabel!
    
    var messages = [String]()
    var time = [String]()
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
            self.UpperLevel.text = "Questions"
            self.Description.text = "Users can identify contacts in J.Anita Team Here"
            self.Back.text = "Back"
        }
        else if(language == "traditional"){
            language = "traditional"
            self.UpperLevel.text = "提問專區"
            self.Description.text = "版主可以和其他用家分享問題"
            self.Back.text = "回到前頁"
        }
        else if(language == "simplified"){
            language = "simplified"
            self.UpperLevel.text = "提问专区"
            self.Description.text = "版主可以和其他用家分享问题"
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



