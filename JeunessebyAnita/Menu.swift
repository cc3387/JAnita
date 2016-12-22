//
//  ViewController.swift
//  JeunessebyAnita
//
//  Created by Clement Chan on 10/4/16.
//  Copyright © 2016 Clement Chan. All rights reserved.
//

import Foundation
import Batch
import Firebase

class Menu:UIViewController{
    
    @IBOutlet weak var AnitaTitle: UILabel!
    @IBOutlet weak var Joinus: UILabel!
    @IBOutlet weak var Homepage: UILabel!
    @IBOutlet weak var Leadership: UILabel!
    @IBOutlet weak var Opportunities: UILabel!
    @IBOutlet weak var YourFuture: UILabel!
    @IBOutlet weak var Travel: UILabel!
    @IBOutlet weak var Shopping: UILabel!
    @IBOutlet weak var Setting: UILabel!
    @IBOutlet weak var Gallery: UILabel!
    @IBOutlet weak var Activity: UILabel!
    @IBOutlet weak var ChatUpper: UILabel!
    @IBOutlet weak var ChatLower: UILabel!
    
    //Link to the shop language
    var link = "en-US"
    
    @IBAction func English(_ sender: Any) {
    language = "english"
    self.AnitaTitle.text = "J.Anita - China"
    self.Joinus.text = "Join Us"
    self.Homepage.text = "Homepage"
    
    //About Leader
    if(Referred.referralemail == "luianita@yahoo.com"){
    self.Leadership.text = "Leadership"
    }
    else{
    self.Leadership.text = "Leadership"
    }
        
    self.Opportunities.text = "Opportunity"
    self.YourFuture.text = "Development"
    self.Travel.text = "Travel"
    self.Shopping.text = "Shop"
    self.Setting.text = "Setting"
    self.Gallery.text = "Gallery"
    self.Activity.text = "Activity"
    self.ChatUpper.text = "Questions"
    self.ChatLower.text = "Share Info"
    self.link = "en-US"
    }
    
    @IBAction func Traditional(_ sender: Any) {
    language = "traditional"
    self.AnitaTitle.text = "J.Anita - 中國"
    self.Joinus.text = "加入我們"
    self.Homepage.text = "回到首頁"
        
    //About Leader
    if(Referred.referralemail == "luianita@yahoo.com"){
    self.Leadership.text = "有關介紹人"
    }
    else{
    self.Leadership.text = "有關介紹人"
    }
    
    self.Opportunities.text = "當今趨勢"
    self.YourFuture.text = "你的前途"
    self.Travel.text = "旅遊機會"
    self.Shopping.text = "購買商品"
    self.Setting.text = "設定和條款"
    self.Gallery.text = "相片集"
    self.Activity.text = "活動訓練"
    self.ChatUpper.text = "提問專區"
    self.ChatLower.text = "資訊分享"
    self.link = "zh-US"
    }
    
    @IBAction func Simplified(_ sender: Any) {
    language = "simplified"
    self.AnitaTitle.text = "J.Anita - 中国"
    self.Homepage.text = "回到首页"
    self.Joinus.text = "加入我们"
    
    //About Leader
    if(Referred.referralemail == "luianita@yahoo.com"){
    self.Leadership.text = "有关介紹人"
    }
    else{
    self.Leadership.text = "有关介紹人"
    }
        
    self.Opportunities.text = "当今趋势"
    self.YourFuture.text = "你的前途"
    self.Travel.text = "旅游机会"
    self.Shopping.text = "购买商品"
    self.Setting.text = "设定和条款"
    self.Gallery.text = "相片集"
    self.Activity.text = "活动训练"
    self.ChatUpper.text = "提问专区"
    self.ChatLower.text = "资讯分享"
    self.link = "zh-US"
    }
    
    @IBAction func Shoplink(_ sender: AnyObject) {
        
        if(ShopName == ""){
        ShopName = "simplyeffective"
        }

        var product = "https://" + ShopName + ".jeunesseglobal.com/"+self.link
        
        if let url = NSURL(string: product) {
            UIApplication.shared.openURL(url as URL)
        }
        
    }
    
    @IBAction func BecomeDistributor(_ sender: AnyObject) {
        
        if(ShopName == ""){
        ShopName = "simplyeffective"
        }
        
        if(ProfileLogin.joinlink == ""){
            if let url = NSURL(string: "https://joffice.jeunesseglobal.com/signup.asp?locale=zh-US&siteurl=" + ShopName) {
                UIApplication.shared.openURL(url as URL)
            }
        }
        else{
            
            if let url = NSURL(string: ProfileLogin.joinlink) {
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
    
    @IBAction func Photos(_ sender: AnyObject) {
        if let url = NSURL(string: "http://s349.photobucket.com/user/cc3387/slideshow/Jeunesse%20By%20Anita") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func Activity(_ sender: AnyObject) {
        if let url = NSURL(string: "http://jeunessebyanita.over-blog.com") {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func Travel(_ sender: AnyObject) {
        
        var product = "https://" + ShopName + ".jeunesseglobal.com/"+self.link+"/lifestyle-rewards"
        
        if let url = NSURL(string: product) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func Buyproducts(_ sender: AnyObject) {
        if(ProfileLogin.loginemail == ""){
            
            var product = "https://" + ShopName + ".jeunesseglobal.com/"+self.link
            
            if let url = NSURL(string: product) {
                UIApplication.shared.openURL(url as URL)
            }
        }
        else{
            
            var ref = FIRDatabase.database().reference()
            ref.queryOrdered(byChild: "Email").queryEqual(toValue: ProfileLogin.loginemail)
                .observe(.childAdded, with: { snapshot in
                    
                    if let source = snapshot.value as? [String:AnyObject] {
                        
                        ProfileLogin.shoplink = source["Shoplink"] as! String
                        
                        if(ProfileLogin.shoplink == ""){
                            
                            var product = "https://simplyeffective.jeunesseglobal.com/"+self.link
                            
                            if let url = NSURL(string: product) {
                                UIApplication.shared.openURL(url as URL)
                            }
                        }
                        else{
                            
                            if let url = NSURL(string: ProfileLogin.shoplink) {
                                UIApplication.shared.openURL(url as URL)
                            }
                        }
                        
                    }
              })
        }
    }
    
    override func viewDidLoad() {
        
        if(language == "english"){
            language = "english"
            self.AnitaTitle.text = "J.Anita - China"
            self.Joinus.text = "Join Us"
            self.Homepage.text = "Homepage"
            
            //About Leader
            if(Referred.referralemail == "luianita@yahoo.com"){
                self.Leadership.text = "Leadership"
            }
            else{
                self.Leadership.text = "Leadership"
            }
            
            self.Opportunities.text = "Opportunity"
            self.YourFuture.text = "Development"
            self.Travel.text = "Travel"
            self.Shopping.text = "Shop"
            self.Setting.text = "Setting"
            self.Gallery.text = "Gallery"
            self.Activity.text = "Activity"
            self.ChatUpper.text = "Questions"
            self.ChatLower.text = "Share Info"
            self.link = "en-US"
        }
        else if(language == "traditional"){
            language = "traditional"
            self.AnitaTitle.text = "J.Anita - 中國"
            self.Joinus.text = "加入我們"
            self.Homepage.text = "回到首頁"
            //About Leader
            if(Referred.referralemail == "luianita@yahoo.com"){
                self.Leadership.text = "有關介紹人"
            }
            else{
                self.Leadership.text = "有關介紹人"
            }
            self.Opportunities.text = "當今趨勢"
            self.YourFuture.text = "你的前途"
            self.Travel.text = "旅遊機會"
            self.Shopping.text = "購買商品"
            self.Setting.text = "設定和條款"
            self.Gallery.text = "相片集"
            self.Activity.text = "活動訓練"
            self.ChatUpper.text = "提問專區"
            self.ChatLower.text = "資訊分享"
            self.link = "zh-US"
        }
        else if(language == "simplified"){
            language = "simplified"
            self.AnitaTitle.text = "J.Anita - 中国"
            self.Homepage.text = "回到首页"
            self.Joinus.text = "加入我们"
            //About Leader
            if(Referred.referralemail == "luianita@yahoo.com"){
                self.Leadership.text = "有关介紹人"
            }
            else{
                self.Leadership.text = "有关介紹人"
            }
            self.Opportunities.text = "当今趋势"
            self.YourFuture.text = "你的前途"
            self.Travel.text = "旅游机会"
            self.Shopping.text = "购买商品"
            self.Setting.text = "设定和条款"
            self.Gallery.text = "相片集"
            self.Activity.text = "活动训练"
            self.ChatUpper.text = "提问专区"
            self.ChatLower.text = "资讯分享"
            self.link = "zh-US"
        }
        
    }
    
    
};

