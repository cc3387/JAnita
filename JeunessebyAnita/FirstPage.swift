//
//  FirstPage.swift
//  JeunessebyAnita
//
//  Created by Clement Chan on 10/22/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Batch
import Firebase

class FirstPage:UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var ReferralWarning: UILabel!
    @IBOutlet weak var Referral: UITextField!
    
    //List of Labels that will be changed due to language choose
    @IBOutlet weak var AnitaTeamLabel: UILabel!
    @IBOutlet weak var RefererEmail: UILabel!
    @IBOutlet weak var StartBrowsing: UILabel!
    @IBOutlet weak var JoinAnitaTeam: UILabel!
    @IBOutlet weak var ListofReferer: UILabel!
    
    //List of referrer pickerview
    @IBOutlet weak var myPicker: UIPickerView!
    
    //////////////////////////////////////
    @IBAction func Anitalink(_ sender: Any) {
        self.Referral.text = "luianita@yahoo.com"
    }
    
    @IBAction func English(_ sender: Any) {
        language = "english"
        self.AnitaTeamLabel.text = "J.Anita - China Region"
        self.RefererEmail.text = "Referrer Email : "
        self.StartBrowsing.text = "Start Browsing"
        self.JoinAnitaTeam.text = "Join The Team Now!"
        self.ListofReferer.text = "List of Referer"
    }
    
    @IBAction func Traditional(_ sender: Any) {
        language = "traditional"
        self.AnitaTeamLabel.text = "J.Anita - 中國地區"
        self.RefererEmail.text = "介紹人電郵: "
        self.StartBrowsing.text = "開始瀏覽"
        self.JoinAnitaTeam.text = "立刻加入Anita的團隊!"
        self.ListofReferer.text = "介紹人電郵列表"
    }
    
    @IBAction func Simplified(_ sender: Any) {
         language = "simplified"
        self.AnitaTeamLabel.text = "J.Anita - 中国地区"
        self.RefererEmail.text = "介绍人电邮 : "
        self.StartBrowsing.text = "开始浏览"
        self.JoinAnitaTeam.text = "立刻加入Anita的团队!"
        self.ListofReferer.text = "介紹人电邮列表"
    }
    
    
    ///////////////////////////////////////
    @IBAction func joinanita(_ sender: Any) {
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
    
    @IBAction func ReferralLogin(_ sender: AnyObject) {
        
        ProfileLogin.loginemail = self.Referral.text!
        Referred.referralemail = self.Referral.text!
        
        if(self.Referral.text != ""){
        
        var ref = FIRDatabase.database().reference()
            
        ref.queryOrdered(byChild: "Email").queryEqual(toValue: ProfileLogin.loginemail).observe(.childAdded, with: { snapshot in
                if let source = snapshot.value as? [String:AnyObject] {
                    Name = source["Owner"] as! String!
                    ShopName = source["Shop"] as! String!
                }
        })
            
        //Load to the next viewcontroller
        loadDestinationVC()
            
        }
        else{
            
            if(language == "english"){
            self.ReferralWarning.text = "Please enter email"
            self.ReferralWarning.textColor = UIColor.red
                
            }
            else if(language == "traditional"){
            self.ReferralWarning.text = "請輸入電郵"
            self.ReferralWarning.textColor = UIColor.red
            }
            else if(language == "simplified"){
            self.ReferralWarning.text = "請输入电邮"
            self.ReferralWarning.textColor = UIColor.red
            }
        }
        
    }
    
    override func viewDidLoad() {
        
        self.Referral.text = "luianita@yahoo.com"
        Referred.referralemail = self.Referral.text!
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        if(language == "english"){
            self.AnitaTeamLabel.text = "J.Anita - China Region"
            self.RefererEmail.text = "Referrer Email : "
            self.StartBrowsing.text = "Start Browsing"
            self.JoinAnitaTeam.text = "Join The Team Now!"
            self.ListofReferer.text = "List of Referer"
        }
        else if(language == "traditional"){
            self.AnitaTeamLabel.text = "J.Anita - 中國地區"
            self.RefererEmail.text = "介紹人電郵: "
            self.StartBrowsing.text = "開始瀏覽"
            self.JoinAnitaTeam.text = "立刻加入Anita的團隊!"
            self.ListofReferer.text = "介紹人電郵列表"
        }
        else if(language == "simplified"){
            self.AnitaTeamLabel.text = "J.Anita - 中国地区"
            self.RefererEmail.text = "介绍人电邮 : "
            self.StartBrowsing.text = "开始浏览"
            self.JoinAnitaTeam.text = "立刻加入Anita的团队!"
            self.ListofReferer.text = "介紹人电邮列表"
        }
        
        myPicker.delegate = self;
        myPicker.dataSource = self;
        
        updateemail();
    }
    
    func loadDestinationVC(){
        self.performSegue(withIdentifier: "ReferralSend", sender: nil)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    var pickerData = [friend_email_list]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView!) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.white
        pickerLabel.text = pickerData[component][row]
        pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 14)
        //pickerLabel.font = UIFont(name: "System Thin", size: 10) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    
    ///////////////////////////////// Update Email Scroll /////////////////////////////////////////////
    enum PickerComponent:Int{
        case email = 0
    }
    
    func updateemail(){
        let sizeComponent = PickerComponent.email.rawValue
        let size = pickerData[sizeComponent][myPicker.selectedRow(inComponent: sizeComponent)]
        self.Referral.text = size;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateemail();
    }
    ///////////////////////////////////////////////////////////////////////////////////
    
    
};

///////////////////////////// Structs For Login ///////////////////////////////////////

struct ProfileLogin{
    static var loginemail = "";
    static var password = "";
    static var uid = "";
    static var phoneid = "";
    static var shoplink = "";
    static var joinlink = "";
    static var foreword = "";
    static var educationlink = "";
    static var refer = "";
    static var name = "Anita";
    static var upper = "";
};

struct Registergroup{
    static var loginemail = "";
    static var password = "";
    static var registername = "";
    static var finalupper = "";
};

struct Referred{
    static var referralemail = "";
};


